pragma solidity ^0.5.0;

contract Test {
    function getResult() public view returns (uint256 product, uint256 sum) {
        uint256 a = 1; // local variable
        uint256 b = 2;
        product = a * b;
        sum = a + b;

        //alternative return statement to return multiple values
        return (a * b, a + b);
    }
}
