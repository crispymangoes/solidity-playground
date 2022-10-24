// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { BitWiseVsArrays } from "src/BitWiseVsArrays.sol";
import { Test, stdStorage, console, StdStorage, stdError } from "@forge-std/Test.sol";

contract BitWiseVsArraysTest is Test {
    BitWiseVsArrays private con;

    uint256[8] private valsArray256;
    uint32[8] private valsArray32;
    uint32[] private valsDynamic32;
    uint256 private vals256;

    uint256[8] private valsArray256_;
    uint32[8] private valsArray32_;
    uint32[] private valsDynamic32_;
    uint256 private vals256_;

    function setUp() public {
        con = new BitWiseVsArrays();

        valsArray256 = [uint256(1), uint256(2), uint256(3), uint256(4), uint256(5), uint256(6), uint256(7), uint256(8)];
        valsArray32 = [uint32(1), uint32(2), uint32(3), uint32(4), uint32(5), uint32(6), uint32(7), uint32(8)];

        valsDynamic32 = new uint32[](8);
        valsDynamic32_ = new uint32[](8);
        for (uint32 i = 0; i < 8; i++) {
            valsDynamic32[i] = i + 1;
            valsDynamic32_[i] = (i + 1) * 10;
        }

        for (uint256 i = 1; i < 9; i++) {
            vals256 |= i << (32 * (i - 1));
        }

        con.setNumbersArray256(valsArray256);
        con.setNumbersArray32(valsArray32);
        con.setDynamicArray32(valsDynamic32);
        con.setNumbersUint256(vals256);

        valsArray256 = [
            uint256(10),
            uint256(20),
            uint256(30),
            uint256(40),
            uint256(50),
            uint256(60),
            uint256(70),
            uint256(80)
        ];
        valsArray32 = [uint32(10), uint32(20), uint32(30), uint32(40), uint32(50), uint32(60), uint32(70), uint32(80)];

        for (uint256 i = 1; i < 9; i++) {
            vals256 |= (10 * i) << (32 * i);
        }
    }

    function testSetNumbersArray256() external {
        con.setNumbersArray256(valsArray256_);
    }

    function testSetNumbersArray32() external {
        con.setNumbersArray32(valsArray32_);
    }

    function testSetDynamicArray32() external {
        con.setDynamicArray32(valsDynamic32_);
    }

    function testSetNumbersUint256() external {
        con.setNumbersUint256(vals256_);
    }

    function testIterateNumbersArray256() external {
        con.iterateNumbersArray256();
    }

    function testIterateNumbersArray32() external {
        con.iterateNumbersArray32();
    }

    function testIterateDynamicArray32() external {
        con.iterateDynamicArray32();
    }

    function testIterateNumbersUint256() external {
        con.iterateNumbersUint256();
    }

    function testGet256Array() external {
        con.get256Array();
    }

    function testGet32Array() external {
        con.get32Array();
    }

    function testGetDynamic32Array() external {
        con.getDynamic32Array();
    }

    function testGet32ArrayFromNumber() external {
        con.get32ArrayFromNumber();
    }
}
