// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Uint256ToArrayLib {
    function convertTo32_8Array(uint256 arr) internal pure returns (uint32[8] memory array) {
        for (uint256 i = 0; i < 8; i++) {
            array[i] = uint32(arr >> (32 * i)); //might need to do unchecked
        }
    }
}
