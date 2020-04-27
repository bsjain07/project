
var Supplier = artifacts.require("./Supplier.sol");
var Customer = artifacts.require("./Customer.sol");

module.exports = function(deployer) {
  deployer.deploy(Supplier);
  deployer.deploy(Customer);
 };
  