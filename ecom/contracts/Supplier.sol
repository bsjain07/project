
pragma solidity ^0.5.0;

contract Supplier {

  event ItemAdd(uint idItem);
  event ProcessOrder(uint cid, uint oid, bool status);

  struct Item {
    uint idItem;
    bytes32 itemName;
    uint price;
  }

  struct Orderlog {
    uint cid;
    uint oid; 
    bool status;
  }

  uint ItemsForSale;
  uint OrdersProcessed;

  mapping (uint => Item) items;
  mapping (uint => Orderlog) orderLogs;


  function addItem(bytes32 itemName, uint price) public {
    uint idItem = ItemsForSale++;
    items[idItem] = Item(idItem, itemName, price);
    emit ItemAdd(idItem);
  }

  function processOrder(uint oid, uint cid) public {
    orderLogs[oid] = Orderlog(cid, oid, true);
    OrdersProcessed ++;
    emit ProcessOrder(cid, oid, true);
  }

 
  function getItem(uint idItem) view public returns (bytes32, uint){
    return (items[idItem].itemName, items[idItem].price);
  }

  function getStatus(uint oid) view public returns (bool) {
    return (orderLogs[oid].status);
  }

  function getNumberOfAvailableItems() view public returns (uint) {
    return ItemsForSale;
  }

  function geNumberOfOrdersProcessed() view public returns (uint){
    return OrdersProcessed;
  }

}
