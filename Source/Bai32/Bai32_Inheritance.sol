pragma solidity ^0.5.0;

contract C {
    //private state variable
    uint256 private data;

    //public state variable
    uint256 public info;

    //constructor
    constructor() public {
        info = 10;
    }

    //private function
    function increment(uint256 a) private pure returns (uint256) {
        return a + 1;
    }

    //public function
    function updateData(uint256 a) public {
        data = a;
    }

    function getData() public view returns (uint256) {
        return data;
    }

    function compute(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

//Derived Contract
contract E is C {
    uint256 private result;
    C private c;

    constructor() public {
        c = new C();
    }

    function getComputedResult() public {
        result = compute(3, 5);
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function getData() public view returns (uint256) {
        return c.info();
    }
}
