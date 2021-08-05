pragma solidity ^0.5.0;

contract test {
    function testArray() public pure {
        uint256 len = 7;

        //dynamic array
        uint256[] memory a = new uint256[](7);

        //bytes is same as byte[]
        bytes memory b = new bytes(len);

        assert(a.length == 7);
        assert(b.length == len);

        //access array variable
        a[6] = 8;

        //test array variable
        assert(a[6] == 8);

        //static array
        uint256[3] memory c = [uint256(1), 2, 3];
        assert(c.length == 3);
    }
}
