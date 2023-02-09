DROP TABLE IF EXISTS balances, trades CASCADE;

CREATE TABLE balances (
    id SERIAL PRIMARY KEY,
    address TEXT,
    denom TEXT,
    amount NUMERIC,
    block_height INTEGER
);

CREATE TABLE trades (
    id SERIAL PRIMARY KEY,
    address TEXT,
    denom TEXT,
    amount NUMERIC,
    block_height INTEGER
);

INSERT INTO balances VALUES(1, '0xabab', 'usdc', 50000000000000, 733755);
INSERT INTO balances VALUES(2, '0x99cc', 'swth', -20000000, 733757);
INSERT INTO balances VALUES(3, '0xabab', 'usdc', -50000000000, 733855);

-- Uncomment this line to test that address 0xabab has total balance less than 500
-- insert into balances values(4, '0xabab', 'tmz', -16649832950, 733855);

INSERT INTO trades VALUES(1, '0xabab', 'swth', 400000000000, 733756);
INSERT INTO trades VALUES(2, '0x99cc', 'usdc', 3500000000000, 733757);
INSERT INTO trades VALUES(3, '0x67f3', 'swth', 72000000000000, 733758);

