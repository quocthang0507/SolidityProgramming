pragma solidity ^0.5.0;

contract SolidityTest {
    constructor() public {}

    function getResult() public view returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
