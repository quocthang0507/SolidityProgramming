pragma solidity ^0.5.0;

contract SolidityTest {
    uint256 storedData;

    constructor() public {
        storedData = 10;
    }

    function getResult() public view returns (string memory) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return integerToString(storedData);
    }

    function integerToString(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10; //assignment operation
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + (_i % 10)));
            _i /= 10; //assignment operation
        }
        return string(bstr); //access local variable
    }
}
