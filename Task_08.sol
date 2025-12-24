// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_08 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getDynamicByteArrayLength(bytes memory _data) public pure returns (uint256) {
        return _data.length;
    }

    function getDynamicByteArrayElement(bytes calldata _data, uint256 _index)
        external
        pure
        returns (bytes1)
    {
        require(_index < _data.length, "Index out of bounds");
        return _data[_index];
    }
}
