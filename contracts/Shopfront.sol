pragma solidity ^0.4.2;

contract Shopfront {
  address admin;
  mapping(uint => Product);


  struct Product {
    uint id;
    uint price;
    uint stock;
    
  }


  function Shopfront(){
  	admin = msg.sender;

  }


  function addProduct(uint price, uint stock){
 	if(msg.sender != admin) throw;



  }


  function set(uint x) {

    storedData = x;
  }

  function get() constant returns (uint) {
    return storedData;
  }
}
