ALTER TABLE transactions ADD COLUMN user_id UUID REFERENCES users (id) NOT NULL;

ALTER TABLE categories ADD COLUMN user_id UUID REFERENCES users (id) NULL; 

ALTER TABLE budgets ADD COLUMN user_id UUID REFERENCES users (id) NOT NULL; 