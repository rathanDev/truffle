pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    //test adoption instance
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    
}