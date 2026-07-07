CREATE OR REPLACE FUNCTION update_mod_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL CHECK (title <> ''),
    description TEXT,
    status TEXT NOT NULL DEFAULT 'Not Started',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TRIGGER set_update_date
    BEFORE UPDATE ON tasks
    FOR EACH ROW
    EXECUTE FUNCTION update_mod_date();

