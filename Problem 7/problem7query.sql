----------------------- Logic --------------------
-- First filter away addresses without any recent trades 
-- (i.e. no corresponding row in Trade table with block_height > 730000)
-- Then group remaining rows based on address to sum the balance for each address
-- The address output is unique because we group by address

-- Assumption: denom is either text or varchar type, and not enum,
-- so that we can compare it with 'usdc', 'swth', 'tmz'
SELECT address 
FROM balances B
WHERE EXISTS (
    SELECT 1
    FROM trades T
    WHERE T.address = B.address AND T.block_height > 730000
)
GROUP BY B.address
HAVING sum(amount * 
    CASE
        WHEN denom = 'usdc' THEN 0.000001
        WHEN denom = 'swth' THEN 0.00000005
        WHEN denom = 'tmz' THEN 0.003
        ELSE 0
    END) > 500