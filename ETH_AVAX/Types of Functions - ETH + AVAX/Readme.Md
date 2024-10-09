
# Types of Functions - ETH + AVAX

For this project we are tasked to create a token that will fulfill the following requirements:
1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
2. Your contract will have a mapping of addresses to balances (address => uint)
3. You will have a mint function that takes two parameters: an address and a value. The function then increases the total supply by that number and increases the balance of the address by that amount.
4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. It will take an address and value just like the mint functions. It will then deduct the value from the total supply and from the balance of the address.
5. Lastly, your burn function should have conditionals to make sure the balance of account is greater than or equal to the amount that is supposed to be burned.


# Public Variables
   string public CoinName = "ECOIN";
    string public CoinSymbol = "EC";
    uint public CoinSupply = 0;

# Mapping Variables 
   mapping (address => uint amount) public CoinBalances;

I utilized the use of function keyword to notify external entities regarding specific occurences within the transaction (all functions)

# Mint Function
     function MintCoin (address from, uint amount ) public {
        CoinSupply += amount;
        CoinBalances [from] += amount;

# Burn Function
    function BurnCoin (address from, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to burn");
        CoinSupply -= amount;
        CoinBalances [from] -= amount;


# Transfer Function
    function TransferCoin (address from, address recipient, uint amount ) public {
        require (CoinBalances [from] >= amount, "Insufficient Balance to transfer");
        CoinBalances [from] -= amount;
        CoinBalances [recipient] += amount;
        CoinSupply -= amount;

# Conditional Statements
      require (CoinBalances [from] >= amount, "Insufficient Balance to burn");
       require (CoinBalances [from] >= amount, "Insufficient Balance to transfer");
To check whether the transaction is valid by ensuring that the balance is always sufficient
