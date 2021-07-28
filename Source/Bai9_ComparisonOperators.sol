pragma solidity ^0.5.0;

contract SolidityTest {
    uint256 storedData;

    constructor() public {
        storedData = 10;
    }

    function getResult() public view returns (string memory) {
        uint256 a = 1; // local variable
        uint256 b = 2;
        uint256 result = a + b;
        return integerToString(result);
    }

    function integerToString(uint256 _i)
        internal
        pure
        returns (string memory _uintAsString)
    {
        if (_i == 0) {
            //comparison operator
            return "0";
        }
        uint256 j = _i;
        uint256 len;

        while (j != 0) {
            //comparison operator
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;

        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        return string(bstr); //access local variable
    }
}