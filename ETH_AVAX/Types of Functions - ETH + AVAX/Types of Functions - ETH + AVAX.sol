// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ECOIN{

    string public CoinName = "ECOIN";
    string public CoinSymbol = "EC";
    uint public CoinSupply = 0;
    // Mapping track balance
    mapping (address => uint amount) public CoinBalances;

    // MINT
    function MintCoin (address from, uint amount ) public {
        CoinSupply += amount;
        CoinBalances [from] += amount;
    }
    // BURN
    function BurnCoin (address from, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to burn");
        CoinSupply -= amount;
        CoinBalances [from] -= amount;
    }
        //TRANSFER
    function TransferCoin (address from, address recipient, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to transfer");
        CoinBalances [from] -= amount;
        CoinBalances [recipient] += amount;
        CoinSupply -= amount;
    }
}