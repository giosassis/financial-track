CREATE TABLE IF NOT EXISTS budgets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES categories (id),
    amount NUMERIC (10, 2) NOT NULL,
    types type_transaction NOT NULL DEFAULT 'income',    
    budget_month DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TRIGGER update_timestamp_budgets
  BEFORE UPDATE ON budgets
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();