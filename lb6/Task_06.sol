// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    address public owner;

    mapping(uint256 => string) private colors;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function addColor(uint256 index, string memory color) public {
        require(index < 7, "Index must be 0..6");
        colors[index] = color;
    }

    function getColor(uint256 index) public view returns (string memory) {
        require(index < 7, "Index must be 0..6");
        return colors[index];
    }

    function getAllColors() public view returns (string[] memory) {
        string;
        for (uint256 i = 0; i < 7; i++) {
            result[i] = colors[i];
        }
        return result;
    }

    function colorExists(uint256 index) public view returns (bool) {
        require(index < 7, "Index must be 0..6");
        return bytes(colors[index]).length != 0;
    }

    function deleteColor(uint256 index) public onlyOwner {
        require(index < 7, "Index must be 0..6");
        delete colors[index];
    }
}
