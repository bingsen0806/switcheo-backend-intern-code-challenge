drop table if exists balances, trades cascade;

create table balances (
    id serial primary key,
    address text,
    denom text,
    amount numeric,
    block_height integer
);

create table trades (
    id serial primary key,
    address text,
    denom text,
    amount numeric,
    block_height int
);

insert into balances values(1, '0xabab', 'usdc', 50000000000000, 733755);
insert into balances values(2, '0x99cc', 'swth', -20000000, 733757);
insert into balances values(3, '0xabab', 'usdc', -50000000000, 733855);

-- Uncomment this line to test that address 0xabab has total balance less than 500
-- insert into balances values(4, '0xabab', 'tmz', -16649832950, 733855);

insert into trades values(1, '0xabab', 'swth', 400000000000, 733756);
insert into trades values(2, '0x99cc', 'usdc', 3500000000000, 733757);
insert into trades values(3, '0x67f3', 'swth', 72000000000000, 733758);

