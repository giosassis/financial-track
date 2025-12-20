CREATE TYPE payment_method AS ENUM (
  'debit_card',
  'credit_card',
  'cash',
  'bank_transfer',
  'pix',
  'other'
);


CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    types type_transaction NOT NULL DEFAULT 'income',    
    amount NUMERIC (10, 2) NOT NULL,
    category_id UUID REFERENCES categories (id),
    method payment_method NOT NULL DEFAULT 'cash',
    transaction_date DATE NOT NULL,
    details VARCHAR (255) NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TRIGGER update_timestamp_transactions
  BEFORE UPDATE ON transactions
  FOR EACH ROW
  EXECUTE FUNCTION update_timestamp();