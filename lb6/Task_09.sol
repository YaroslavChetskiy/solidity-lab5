// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_09 {
    event UserAdded(uint256 indexed userId, string message);
    event UserRemoved(uint256 indexed userId, string message);

    mapping(uint256 => string) public users;
    uint256 public userCount;

    function addUser(string calldata name) external {
        userCount++;
        users[userCount] = name;
        emit UserAdded(userCount, "User added");
    }

    function removeUser(uint256 userId, string calldata message) external {
        require(bytes(users[userId]).length != 0, "User does not exist");
        delete users[userId];
        emit UserRemoved(userId, message);
    }
}
