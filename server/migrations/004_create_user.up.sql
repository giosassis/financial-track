CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(16) NOT NULL,
    email VARCHAR (254) NOT NULL,
    password_hash VARCHAR (255) NOT NULL,
    full_name VARCHAR (50) NOT NULL
);

CREATE TRIGGER update_timestamp_users
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();