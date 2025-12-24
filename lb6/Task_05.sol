// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_05 {
    int256[] private tempsC;

    function addTemperature(int256 celsius) external {
        tempsC.push(celsius);
    }

    function addTemperatures(int256[] calldata celsiusArray) external {
        for (uint256 i = 0; i < celsiusArray.length; i++) {
            tempsC.push(celsiusArray[i]);
        }
    }

    function getTemperaturesCelsius() external view returns (int256[] memory) {
        return tempsC;
    }

    function _toFahrenheit(int256 celsius) internal pure returns (int256) {
        return (celsius * 9) / 5 + 32;
    }

    function convertArrayToFahrenheit(int256[] calldata celsiusArray)
        external
        pure
        returns (int256[] memory)
    {
        int256[] memory result = new int256[](celsiusArray.length);

        for (uint256 i = 0; i < celsiusArray.length; i++) {
            result[i] = (celsiusArray[i] * 9) / 5 + 32;
        }

        return result;
    }

    function getTemperaturesFahrenheit() external view returns (int256[] memory) {
        int256[] memory result = new int256[](tempsC.length);

        for (uint256 i = 0; i < tempsC.length; i++) {
            result[i] = _toFahrenheit(tempsC[i]);
        }

        return result;
    }

    function getCount() external view returns (uint256) {
        return tempsC.length;
    }
}
