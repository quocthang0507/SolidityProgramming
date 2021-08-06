pragma solidity ^0.5.0;

contract FreshJuiceShop {
    enum GlassSize {
        SMALL,
        MEDIUM,
        LARGE
    }

    GlassSize userChoice;
    GlassSize constant defaultChoice = GlassSize.MEDIUM;

    function setLarge() public {
        userChoice = GlassSize.LARGE;
    }

    function setMedium() public {
        userChoice = GlassSize.MEDIUM;
    }

    function setSmall() public {
        userChoice = GlassSize.SMALL;
    }

    function getChoice() public view returns (GlassSize) {
        return userChoice;
    }

    function getDefaultChoice() public pure returns (uint256) {
        return uint256(defaultChoice);
    }
}
