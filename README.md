# Notes on Accessing/Grading Every Question

1. git clone this repository

## Problem 1

1. All the 3 functions for `sum_to_n()` are in the file named **problem1.js**

## Problem 4

1. `cd "Problem 4" into the directory.
2. `npm install` to install the node_modules
3. Ensure that ts-node is also installed globally so that `ts-node` is recognized as a command-line function.
4. `ts-node retrieve-holders.ts` to output the specific holder balances at the 3 addresses.

## Problem 5

** The util contract is in `contracts/BalanceChecker` file, test file is `test.js`
** I have compiled and deployed `BalanceChecker` utility Contract to BSC testnet (https://bsc-testnet.public.blastapi.io) successfully
** The wallet address in `test.js` is also a wallet on the Bsc Testnet
** However, I cannot find existing token contracts in the same wallet on Bsc Testnet, hence the test is currently not working.

## Problem 7

1. `cd "Problem 4" into the directory.
2. `psql -U postgres` on terminal to launch postgresql and input password
3. If you wish to load simple schema and sample data for testing, run `\i setupTests.sql`
4. `problem7query.sql` contains the sql code for a single query statement only, without any creation of schema and loading of sample.
5. run `\i problem7query.sql` after step 3 if you wish to test the query with simple sample data. One row of result **0xabab** is expected.
