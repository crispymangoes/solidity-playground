// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Uint256ToArrayLib {
    function convertTo32_8Array(uint256 arr) internal pure returns (uint32[8] memory array) {
        array[0] = uint32(arr);
        array[1] = uint32(arr >> 32);
        array[2] = uint32(arr >> 64);
        array[3] = uint32(arr >> 96);
        array[4] = uint32(arr >> 128);
        array[5] = uint32(arr >> 160);
        array[6] = uint32(arr >> 192);
        array[7] = uint32(arr >> 224);
        // for (uint256 i = 0; i < 8; i++) {
        //     array[i] = uint32(arr >> (32 * i)); //might need to do unchecked
        // }
    }
}
