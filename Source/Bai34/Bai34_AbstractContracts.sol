pragma solidity ^0.5.0;

contract Calculator {
    function getResult() public view returns (uint256);
}

contract Test is Calculator {
    function getResult() public view returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
