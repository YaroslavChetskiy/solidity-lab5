// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_03 {
    function generateFactorial(uint256 n) external pure returns (uint256) {
        require(n <= 57, "n is too large (uint256 overflow)");

        uint256 result = 1;

        while (n > 1) {
            result *= n;
            n--;
        }

        return result;
    }
}
