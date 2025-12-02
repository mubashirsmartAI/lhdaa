-- SQL Script to set primary currency
-- Run this in your MySQL/MariaDB database

-- First, check if primary currency exists
SELECT * FROM client_currencies WHERE is_primary = 1;

-- If no result, then run the following:

-- Get first client code (replace with your actual client code if needed)
SET @client_code = (SELECT code FROM clients LIMIT 1);

-- Get first currency ID (preferably USD, otherwise first available)
SET @currency_id = COALESCE(
    (SELECT id FROM currencies WHERE iso_code = 'USD' LIMIT 1),
    (SELECT id FROM currencies ORDER BY priority DESC, id ASC LIMIT 1)
);

-- Update existing record if exists, otherwise insert
INSERT INTO client_currencies (client_code, currency_id, is_primary, doller_compare, created_at, updated_at)
VALUES (@client_code, @currency_id, 1, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE 
    is_primary = 1,
    doller_compare = COALESCE(doller_compare, 1),
    updated_at = NOW();

-- Or if the above doesn't work, use this simpler version:
-- First, set all to not primary for this client
UPDATE client_currencies 
SET is_primary = 0 
WHERE client_code = @client_code;

-- Then insert or update the primary currency
INSERT INTO client_currencies (client_code, currency_id, is_primary, doller_compare, created_at, updated_at)
SELECT @client_code, @currency_id, 1, 1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM client_currencies 
    WHERE client_code = @client_code AND currency_id = @currency_id
);

-- Update if exists
UPDATE client_currencies 
SET is_primary = 1, doller_compare = COALESCE(doller_compare, 1), updated_at = NOW()
WHERE client_code = @client_code AND currency_id = @currency_id;

-- Verify
SELECT 
    cc.*, 
    c.name as currency_name, 
    c.iso_code, 
    c.symbol,
    cl.name as client_name
FROM client_currencies cc
LEFT JOIN currencies c ON c.id = cc.currency_id
LEFT JOIN clients cl ON cl.code = cc.client_code
WHERE cc.is_primary = 1;
