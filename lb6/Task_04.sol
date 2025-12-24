// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_04 {
    function generateFibo(uint256 n) external pure returns (uint256) {
        uint256 a = 0;
        uint256 b = 1;

        do {
            uint256 c = a + b;
            a = b;
            b = c;
        } while (b <= n);

        return b;
    }
}
