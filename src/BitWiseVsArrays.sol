// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import { Uint256ToArrayLib } from "src/Uint256ToArrayLib.sol";
import { console } from "@forge-std/Test.sol";

contract BitWiseVsArrays {
    using Uint256ToArrayLib for uint256;
    uint256[8] public numbersArray256;
    uint32[8] public numbersArray32;
    uint32[] public dynamicArray32;
    uint256 public numbersUint256;

    function setNumbersArray256(uint256[8] memory _vals) public {
        numbersArray256 = _vals;
    }

    function setNumbersArray32(uint32[8] memory _vals) public {
        numbersArray32 = _vals;
    }

    function setDynamicArray32(uint32[] memory _vals) public {
        dynamicArray32 = _vals;
    }

    function setNumbersUint256(uint256 _vals) public {
        numbersUint256 = _vals;
    }

    function iterateNumbersArray256() public view returns (uint256 sum) {
        uint256[8] memory memNumbersArray256 = numbersArray256;

        for (uint256 i = 0; i < 8; i++) {
            sum += memNumbersArray256[i];
        }
    }

    function iterateNumbersArray32() public view returns (uint256 sum) {
        uint32[8] memory memNumbersArray32 = numbersArray32;

        for (uint256 i = 0; i < 8; i++) {
            sum += memNumbersArray32[i];
        }
    }

    function iterateDynamicArray32() public view returns (uint256 sum) {
        uint32[] memory memDynamicArray32 = dynamicArray32;

        for (uint256 i = 0; i < 8; i++) {
            sum += memDynamicArray32[i];
        }
    }

    function iterateNumbersUint256() public view returns (uint256 sum) {
        uint256 memNumberUint256 = numbersUint256;
        for (uint256 i = 0; i < 8; i++) {
            sum += uint32(memNumberUint256 >> (32 * i)); //might need to do unchecked
        }
    }

    function get256Array() public view returns (uint256[8] memory) {
        return numbersArray256;
    }

    function get32Array() public view returns (uint32[8] memory) {
        return numbersArray32;
    }

    function getDynamic32Array() public view returns (uint32[] memory) {
        return dynamicArray32;
    }

    function get32ArrayFromNumber() public view returns (uint32[8] memory array) {
        // console.log("Howdy");
        // So if you enforce that a 0 means the end of the array then you can break early.
        // for (uint8 i = 0; i < 8; i++) console.log(array[i]);
        // for (uint256 i = 0; i < 8; i++) {
        //     array[i] = uint32(numbersUint256 >> (32 * i)); //might need to do unchecked
        // }
        return numbersUint256.convertTo32_8Array();
    }
}
