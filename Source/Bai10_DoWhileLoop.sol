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
        uint256 j = _i;
        uint256 len;

        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;

        do {
            // do while loop
            bstr[k--] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        } while (_i != 0);
        return string(bstr);
    }
}

//Output
//0: string: 12
