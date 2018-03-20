pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    //test adoption instance
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);
        uint expectedId = 8;
        Assert.equal(returnedId, expectedId, "Adoption of petId 8 should be recorded");
    }

    function testGetAdopterAddressByPetId() public {
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "Owner of pet id 8 should be recorded");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
      // Expected owner is this contract
      address expected = this;

      // Store adopters in memory rather than contract's storage
      address[16] memory adopters = adoption.getAdopters();

      Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }

}