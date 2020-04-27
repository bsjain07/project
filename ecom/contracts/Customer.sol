pragma solidity ^0.5.0;


contract Customer {
event OrderRaisedOrUpdated(uint idOrder);

  struct Customer {
    uint cid;
    bytes32 cName;
  }

  struct Orderlog {
    uint Oid;
    uint cid;
    bytes32 itemName;
    uint quantity;
    bool status;
  }

  uint PItems;
  uint RItems;

  mapping (uint => Customer) customers;
  mapping (uint => Orderlog) orderLogs;

  constructor() public {
  customers[0] = Customer(1, "Bharat Kumar");
  }

  
  function purchaseItem(bytes32 itemName, uint quantity) public {
    uint oid = PItems++;
    orderLogs[oid] = Orderlog(oid, 0, itemName, quantity, false);
    emit OrderRaisedOrUpdated(oid);
  }

  function recieveItem(uint oid) public {
      RItems++;
      orderLogs[oid].status = true;
      emit OrderRaisedOrUpdated(oid);
  }

 
  function getOrderDetails(uint oid) view public returns (bytes32, uint, bool){
   return (orderLogs[oid].itemName, orderLogs[oid].quantity, orderLogs[oid].status);
  }

  function getNumberOfItemsPurchased() view public returns (uint) {
    return PItems;
  }

  function getNumberOfItemsReceived() view public returns (uint) {
    return RItems;
  }

}
