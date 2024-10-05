

Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
Your contract will have a mapping of addresses to balances (address => uint)
You will have a mint function that takes two parameters: an address and a value. The function then increases the total supply by that number and increases the balance of the address by that amount.
Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. It will take an address and value just like the mint functions. It will then deduct the value from the total supply and from the balance of the address.
Lastly, your burn function should have conditionals to make sure the balance of account is greater than or equal to the amount that is supposed to be burned.

Public Variables
string public ECOIN; // name
string public EC; // symbol
uint public CoinSupply; // total supply or initial value

Mapping Variables
mapping(address => uint) public CoinBalances;
Function Mint(address from, uint amount);
Fuction Burn(address from, uint amount);


Mint Function
    function MintCoin (address from, uint amount ) public {
        CoinSupply += amount;
        CoinBalances [from] += amount;
    }
Utilized the use of "function" keyword as a way to log the transactions happening to and from the wallet address

Burn Function
    function BurnCoin (address from, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to burn");
        CoinSupply -= amount;
        CoinBalances [from] -= amount;
    }
    
Utilized the use of "function" keyword as a way to log the transactions happening to and from the wallet address

  Transfer Function
    function TransferCoin (address from, address recipient, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to transfer");
        CoinBalances [from] -= amount;
        CoinBalances [recipient] += amount;
        CoinSupply -= amount;
    }
    
Utilized the use of "function" keyword as a way to log the transactions happening to and from the wallet address

Conditional Statement
   require (CoinBalances [from] >= amount, "Insufficient Balance to burn");
require (CoinBalances [from] >= amount, "Insufficient Balance to transfer");


To check whether the transaction is valid by ensuring that the balance is always greater or equal to
