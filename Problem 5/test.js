const { ethers } = require("ethers");

// address of BalanceChecker contract deployed to BSC Testnet
const ADDR = "0x85f1b7615c3Ca20870f2c9D77ca88Bb520B9750e";
const ABI = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "walletAddress",
          "type": "address"
        },
        {
          "internalType": "address[]",
          "name": "tokenAddresses",
          "type": "address[]"
        }
      ],
      "name": "getBalances",
      "outputs": [
        {
          "components": [
            {
              "internalType": "address",
              "name": "token",
              "type": "address"
            },
            {
              "internalType": "uint256",
              "name": "balance",
              "type": "uint256"
            }
          ],
          "internalType": "struct BalanceChecker.TokenBalance[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ];

// my metamask wallet address connected to bsc testnet
const ADDRESS = "0x574151a7f54f52e1F194EE598744337f7eC66eb6";

// However, tokens below are not deployed to bsc test net
const TOKENS = [
  "0x574151a7f54f52e1F194EE598744337f7eC66eb6",
  "0x1bFAFd366DA5a322260DAb9460f5B6fA5d55e93D",
];

// you can use your own RPC provider url (no need to deploy to mainnet)
const provider = ethers.getDefaultProvider();

const test = async () => {
  const contract = new ethers.Contract(ADDR, ABI, provider);

  const balances = await contract.getBalances(ADDRESS, TOKENS);

  return balances;
};

test().then(console.log);
