pragma solidity ^0.5.0;

contract Test {
    function getSum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function getSum(
        uint256 a,
        uint256 b,
        uint256 c
    ) public pure returns (uint256) {
        return a + b + c;
    }

    function callSumWithTwoArguments() public pure returns (uint256) {
        return getSum(1, 2);
    }

    function callSumWithThreeArguments() public pure returns (uint256) {
        return getSum(1, 2, 3);
    }
}
