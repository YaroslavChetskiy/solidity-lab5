// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_09 {
    struct User {
        uint256 id;
        string name;
        bool exists;
    }

    mapping(uint256 => User) private users;
    uint256[] private userIds;

    event UserAdded(uint256 indexed userId, string message);
    event UserRemoved(uint256 indexed userId, string message);

    function addUser(uint256 userId, string calldata name) external {
        require(userId != 0, "Invalid userId");
        require(!users[userId].exists, "User already exists");

        users[userId] = User({id: userId, name: name, exists: true});
        userIds.push(userId);

        emit UserAdded(userId, "User added");
    }

    function removeUser(uint256 userId, string calldata message) external {
        require(users[userId].exists, "User does not exist");

        delete users[userId];

        for (uint256 i = 0; i < userIds.length; i++) {
            if (userIds[i] == userId) {
                userIds[i] = userIds[userIds.length - 1];
                userIds.pop();
                break;
            }
        }

        emit UserRemoved(userId, message);
    }

    function getUser(uint256 userId) external view returns (uint256 id, string memory name, bool exists) {
        User storage u = users[userId];
        return (u.id, u.name, u.exists);
    }

    function getAllUserIds() external view returns (uint256[] memory) {
        return userIds;
    }
}
