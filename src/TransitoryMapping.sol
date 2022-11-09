// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import { console } from "@forge-std/Test.sol";

contract TransitoryMapping {
    mapping(address => uint256) private internalPrice;
    uint256 number;

    function transitoryStore(address asset, uint256 num) public {
        number = num;
        number = 0;
    }

    // arrays are passed by REFERENCE! So this array is updated by addToArray!
    // Also we only copy the array into memory once!
    function doArrayWork(uint256[8] memory arr) public {
        addToArray(arr, 0, 11);
        addToArray(arr, 1, 1);
        addToArray(arr, 2, 1);
        addToArray(arr, 3, 1);
        addToArray(arr, 4, 1);
        addToArray(arr, 5, 1);
        addToArray(arr, 6, 1);
        addToArray(arr, 7, 1);
    }

    function addToArray(
        uint256[8] memory arr,
        uint8 index,
        uint256 val
    ) internal pure {
        arr[index] = val;
    }

    function doNumberWork(uint256 num) public returns (uint256) {
        addToNumber(num, 10);
        addToNumber(num, 100);
        return num;
    }

    function addToNumber(uint256 num, uint256 val) internal {
        num += val;
    }

    function arrayCopy(uint256[8] memory arr) public pure {
        hunch();
    }

    function numberCopy(uint256 num) public pure {
        hunch();
    }

    function hunch() public pure {}
}
