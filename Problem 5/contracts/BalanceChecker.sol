pragma solidity >=0.4.22;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract BalanceChecker {

    struct TokenBalance {
        address token;
        uint256 balance;
    }

    function getBalances(address walletAddress, address[] memory tokenAddresses) public view  returns (TokenBalance[] memory) {
        TokenBalance[] memory balances = new TokenBalance[](tokenAddresses.length);

        for (uint256 i = 0; i < tokenAddresses.length; i++) {
            address tokenAddress = tokenAddresses[i];
            uint256 tokenBalance = IERC20(tokenAddress).balanceOf(walletAddress);
            TokenBalance memory newBalance = TokenBalance({
                token: tokenAddress,
                balance: tokenBalance
            });
            balances[i] = newBalance;
        }
        return balances;
    }
}
