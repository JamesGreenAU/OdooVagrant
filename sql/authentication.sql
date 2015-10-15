SELECT 'Authentication script started...' AS Message;
CREATE USER openerp WITH CREATEDB NOCREATEROLE CREATEUSER PASSWORD 'openerp';
SELECT 'Authentication script ended.' AS Message;