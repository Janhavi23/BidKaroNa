pragma solidity 0.5.16;

contract Asset {
  
  // State variables
  address owner;
  string public description;

  // Modifiers
  modifier onlyOwner() {
    require((tx.origin == owner) || (msg.sender == owner), "Only owner can call this");
    _;
  }

  // Methods
  constructor(string memory _description) public {
    owner = msg.sender;
    description = _description;
  }

  function getOwner() public view returns (address) {
    return owner;
  }

  function setOwner(address _owner) public onlyOwner returns (bool) {
    owner = _owner;
    return true;
  }

}