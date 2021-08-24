pragma solidity ^0.5.0;

library Sum {
    function sumUsingInlineAssembly(uint256[] memory _data)
        public
        pure
        returns (uint256 o_sum)
    {
        for (uint256 i = 0; i < _data.length; ++i) {
            assembly {
                o_sum := add(o_sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
            }
        }
    }
}

contract Test {
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function sum() external view returns (uint256) {
        return Sum.sumUsingInlineAssembly(data);
    }
}
