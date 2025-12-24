// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_07 {
    uint8 public constant COLORS_COUNT = 7;
    mapping(uint8 => string) private colors;

    function addColor(uint8 index, string calldata color) external {
        require(index < COLORS_COUNT, "Index out of range");
        require(bytes(colors[index]).length == 0, "Color already exists");
        colors[index] = color;
    }

    function getColor(uint8 index) external view returns (string memory) {
        require(index < COLORS_COUNT, "Index out of range");
        return colors[index];
    }

    function getAllColors() external view returns (string[] memory) {
        string[] memory result = new string[](COLORS_COUNT);
        for (uint8 i = 0; i < COLORS_COUNT; i++) {
            result[i] = colors[i];
        }
        return result;
    }

    function updateColor(uint8 index, string calldata newColor) external {
        require(index < COLORS_COUNT, "Index out of range");
        require(bytes(colors[index]).length != 0, "Color does not exist");
        colors[index] = newColor;
    }

    function colorExists(uint8 index) external view returns (bool) {
        require(index < COLORS_COUNT, "Index out of range");
        return bytes(colors[index]).length != 0;
    }

    function deleteColor(uint8 index) external {
        require(index < COLORS_COUNT, "Index out of range");
        require(bytes(colors[index]).length != 0, "Color does not exist");
        delete colors[index];
    }

    function replaceAllColors(string[] calldata newColors) external {
        require(newColors.length == COLORS_COUNT, "Invalid colors length");
        for (uint8 i = 0; i < COLORS_COUNT; i++) {
            colors[i] = newColors[i];
        }
    }
}
