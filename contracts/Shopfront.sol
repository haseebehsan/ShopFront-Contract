/*

--A shopfront

-The project will start as a database whereby:

as an administrator, you can add products, which consist of an id, a price and a stock.
as a regular user you can buy 1 of the products.
as the owner you can make payments or withdraw value from the contract.

-Eventually, you will refactor it to include:

ability to remove products.
co-purchase by different people.
add merchants akin to what Amazon has become.
add the ability to pay with a third-party token.






*/

pragma solidity ^0.4.2;

contract Shopfront {
  address admin;
  mapping(uint => Product) products;
  uint ids;
  uint balance;



  struct Product {
    uint id;
    uint price;
    uint stock;
    bool active;
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
 	newProduct.active = true;

 	products[ids] = newProduct;
 	return newProduct.id;


  }


  function set(uint x) {

    storedData = x;
  }

  function get() constant returns (uint) {
    return storedData;
  }

  function buyProduct(uint productID, uint stock)
  payable
  public{
  	Product product = products[productID];
  	if(!product.active) throw; //if product is not active;
  	if(msg.value < product.price) throw;
  	if(product.stock <= 0) throw;
  }
}
