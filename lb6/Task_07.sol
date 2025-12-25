// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_07 {
    struct Athlete {
        string name;
        uint256 result;
    }

    mapping(uint => Athlete) public athletes;
    address public owner;
    uint public constant ATHLETES_COUNT = 3;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        addAthlete(0, "John Doe", 0);
        addAthlete(1, "Jane Smith", 0);
        addAthlete(2, "Mike Johnson", 0);
    }

    function addAthlete(uint index, string memory athlete, uint256 result) public {
        athletes[index] = Athlete(athlete, result);
    }

    function addAthleteExternal(uint index, string calldata athlete, uint256 result) external {
        athletes[index] = Athlete(athlete, result);
    }

    function getAthlete(uint index) external view returns (string memory, uint256) {
        Athlete storage a = athletes[index];
        return (a.name, a.result);
    }

    function getAllAthletes() public view returns (string[] memory, uint256[] memory) {
        string[] memory names = new string[](ATHLETES_COUNT);
        uint256[] memory results = new uint256[](ATHLETES_COUNT);

        for (uint i = 0; i < ATHLETES_COUNT; i++) {
            names[i] = athletes[i].name;
            results[i] = athletes[i].result;
        }

        return (names, results);
    }

    function updateAthlete(uint index, string calldata newAthlete, uint256 newResult) public {
        Athlete storage a = athletes[index];
        a.name = newAthlete;
        a.result = newResult;
    }

    function athleteExists(uint index) public view returns (bool) {
        return bytes(athletes[index].name).length > 0;
    }

    function removeAthlete(uint index) public onlyOwner {
        delete athletes[index];
    }

    function replaceAllAthletes(string[] calldata newAthletes, uint256[] calldata newResults) public onlyOwner {
        require(newAthletes.length == ATHLETES_COUNT, "Must provide exactly 3 athletes");
        require(newResults.length == ATHLETES_COUNT, "Must provide exactly 3 results");

        for (uint i = 0; i < ATHLETES_COUNT; i++) {
            athletes[i] = Athlete(newAthletes[i], newResults[i]);
        }
    }
}
