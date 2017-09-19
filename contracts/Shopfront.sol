pragma solidity ^0.4.2;

contract Shopfront {
  address admin;
  mapping(uint => Product) products;
  uint ids;



  struct Product {
    uint id;
    uint price;
    uint stock;
    
  }


  function Shopfront(){
  	admin = msg.sender;

  }

  //function to add new products
  function addProduct(uint price, uint stock)
  public
  returns(uint id){
 	if(msg.sender != admin) throw; //throws if caller is not admin

 	ids++;
 	Product memory newProduct;
 	newProduct.id = ids;
 	newProduct.price = price;
 	newProduct.stock = stock;

 	products[ids] = newProduct;
 	return newProduct.id;


  }


  function set(uint x) {

    storedData = x;
  }

  function get() constant returns (uint) {
    return storedData;
  }
}
