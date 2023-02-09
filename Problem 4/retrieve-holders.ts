import { ethers, JsonRpcProvider, Contract, BigNumberish } from 'ethers';

const bscNodeUrl = 'https://bsc-dataseed.binance.org:443'
const provider = new JsonRpcProvider(bscNodeUrl);
const tokenAddress = '0xc0ecb8499d8da2771abcbf4091db7f65158f1468';

const simplifiedAbi = [
    {
        "constant": true,
        "inputs": [
            {
                "name": "tokenOwner",
                "type": "address"
            }
        ],
        "name": "balanceOf",
        "outputs": [
            {
                "name": "balance",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }
];

async function getHolderAmounts(tokenAddress: string, holderAddresses: string[]) {
    const tokenContract = new Contract(tokenAddress, simplifiedAbi, provider);

    const balancePromises: Promise<BigNumberish>[] = holderAddresses.map(address => {
        return tokenContract.balanceOf(address);
    });

    const balances = await Promise.all(balancePromises);

    for (let i = 0; i < holderAddresses.length; i++) {
        console.log(`${holderAddresses[i]} ${balances[i].toString()}`);
    }
}

const addressesToQuery = [
    '0xb5d4f343412dc8efb6ff599d790074d0f1e8d430',
    '0x0020c5222a24e4a96b720c06b803fb8d34adc0af',
    '0xd1d8b2aae2ebb2acf013b803bc3c24ca1303a392'
];

getHolderAmounts(tokenAddress, addressesToQuery).catch(error => {
    console.error(error);
});
