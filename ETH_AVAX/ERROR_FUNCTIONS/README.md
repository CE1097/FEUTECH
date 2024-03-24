Hello World
This Solidity program is a simple Contract deployment program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

Description
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has a single function that returns the string "Hello World!". This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

Getting Started
Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Token {

  constructor() {
    owner = msg.sender;
  }

  // Variables
  string public name = "Sample";
  string public symbol = "SMP";
  uint public totalSupply = 0;
  address public owner;

  // Events (This will record of what is happenining in the contract)
  event Mint(address indexed to, uint amount);
  event Burn(address indexed from, uint amount);
  event Transfer(address indexed from, address indexed to, uint value);

  // Error
  error InsufficientBalance(uint balance, uint withdrawAmount);

  // Mapping (Will store mapping and balance of addresses)
  mapping(address => uint) public balances;

  // Modifier (Used to check the message of sender, can be called only by onwer, not anyone else)
  modifier onlyOwner() {
    assert(msg.sender == owner);
    _;
  }

  // Mint
  function mint(address _address, uint _value) public onlyOwner {
    totalSupply += _value;
    balances[_address] += _value;
    emit Mint(_address, _value);
  }

  // Burn
  function burn(address _address, uint _value) public onlyOwner {
    if (balances[_address] < _value) {
      revert InsufficientBalance({balance: balances[_address], withdrawAmount: _value});
    } else {
      totalSupply -= _value;
      balances[_address] -= _value;
      emit Burn(_address, _value);
    }
  }

  // Transfer (Must be
  function transfer(address _receiver, uint _value) public {
    require(balances[msg.sender] >= _value, "Amount must be greater than the transfer value!");
    balances[msg.sender] -= _value;
    balances[_receiver] += _value;
    emit Transfer(msg.sender, _receiver, _value);
  }
}

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.