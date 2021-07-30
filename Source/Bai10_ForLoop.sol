pragma solidity ^0.5.0;

contract SolidityTest {
    uint256 storedData;

    constructor() public {
        storedData = 10;
    }

    function getResult() public view returns (string memory) {
        uint256 a = 10;
        uint256 b = 2;
        uint256 result = a + b;
        return integerToString(result);
    }

    function integerToString(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = 0;
        uint256 len;
        for (j = _i; j != 0; j /= 10) {
            //for loop example
            len++;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        return string(bstr); //access local variable
    }
}

//Output
//0: string: 12
