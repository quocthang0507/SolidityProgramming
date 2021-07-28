pragma solidity ^0.5.0;

contract SolidityTest {
    uint256 storedData; // State variable

    constructor() public {
        storedData = 10;
    }

    function getResult() public view returns (uint256) {
        uint256 a = 1; // local variable
        uint256 b = 2;
        uint256 result = a + b;
        return result; //access the local variable
    }
}
