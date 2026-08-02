const API_BASE_URL = "http://localhost:3000";

const loginForm = document.querySelector("#login-form");
const usernameInput = document.querySelector("#username");
const passwordInput = document.querySelector("#password");
const logoutButton = document.querySelector("#logout");
const identity = document.querySelector("#identity");
const loadButton = document.querySelector("#load-items");
const itemList = document.querySelector("#items");
const form = document.querySelector("#delete-item-form");
const itemNbrInput = document.querySelector("#item-nbr");
const statusBox = document.querySelector("#status");
let accessToken;
let currentUser;

function setStatus(message) {
    statusBox.textContent = message;
}

function updateIdentity() {
    identity.textContent = currentUser ?
        `Logged in as ${currentUser.username} (${currentUser.role}).` : 
        "Not logged in.";
}


function authHeaders(headers = {}) {
    return accessToken ? { ...headers, Authorization: `Bearer ${accessToken}` } : headers;
}


async function readResponse(response) {
    const data = await response.json();

    console.log(data);
    console.log(response);

    if (!response.ok && response.status === 401) {
        accessToken = undefined;
        currentUser = undefined;
        updateIdentity();
        throw new Error(data.message ?? `Request failed with status ${response.status}`);
    }

    return data;
}

function renderItems(items) {
    itemList.replaceChildren();

    for (const item of items) {
        const li = document.createElement("li");
        li.textContent = `Project: ${item.project} -- ${item.id}: ${item.title}`;
        itemList.appendChild(li);
    }
}

async function loadItems() {
    setStatus("Loading tasks...");

    try {
        const response = await fetch(`${API_BASE_URL}/tasks`, {
            headers: authHeaders()
        });
        const data = await readResponse(response);
        renderItems(data.data);
        setStatus("Tasks loaded.");
    } catch (error) {
        setStatus(error.message);
    }
}

async function delItem(nbr) {
    setStatus("Deleting task...");

    try {
        const response = await fetch(`${API_BASE_URL}/tasks/${nbr}`, {
            method: "DELETE",
            headers: authHeaders({ "Content-Type": "application/json" })
        });
        const data = await readResponse(response);
        setStatus(`Deleted task: ${data.id}`);
        await loadItems();
        return;
    } catch (error) { setStatus(error.message); return; }
}


async function login(username, password) {
    setStatus("Logging in...");

    console.log("\n\nLogging in...\n\n");

    try {
        const response = await fetch(`${API_BASE_URL}/auth/login`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ username, password })
        });
        const data = await readResponse(response);
        console.log(response);
        console.log("\n");
        console.log(data);
        accessToken = data.accessToken;
        currentUser = data.user;
        updateIdentity();
        setStatus(`Logged in as ${currentUser.username}. Token expires in ${data.expiresIn}.`);
    } catch (error) {
        setStatus("Error in app.js login() function.");  // (error.message);
    }
}


loadButton.addEventListener("click", loadItems);


loginForm.addEventListener("submit", async (event) => {
    event.preventDefault();
    await login(usernameInput.value.trim(), passwordInput.value);
    passwordInput.value = "";
});


logoutButton.addEventListener("click", () => {
    accessToken = undefined;
    currentUser = undefined;
    updateIdentity();
    setStatus("Logged out. The token was removed from this page's memory.");
});

form.addEventListener("submit", async (event) => {
    event.preventDefault();
    const nbr = parseInt(Number(itemNbrInput.value));
    if (typeof nbr === NaN) {
        setStatus("Task number is required.");
        return;
    }
    itemNbrInput.value = "";
    await delItem(nbr);
});
