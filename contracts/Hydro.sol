// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

/**
 * 
 * @title Hydro
 * 
 */
 contract Hydro {
      address seller;
      
      int costPerKWH;
      
      mapping (address => uint) private powerAvailable;
      mapping (address => uint) private activeConsumers;
      bool powerFlowing;
      
      constructor() public payable {
          seller = msg.sender;
          powerFlowing = false;
          
      }
      
      modifier onlyOwner() {
          require(msg.sender == seller);
          _;  
      }
      
      function buyPower(uint amountKWH) public payable {
          powerAvailable[address(this)] = getAvailablePower();
      }
      
 }