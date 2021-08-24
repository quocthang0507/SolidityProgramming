pragma solidity ^0.5.0;

library Search {
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return uint256(-1);
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

    function isValuePresent() external view returns (uint256) {
        uint256 value = 4;

        //search if value is present in the array using Library function
        uint256 index = Search.indexOf(data, value);
        return index;
    }
}
