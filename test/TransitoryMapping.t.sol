// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { TransitoryMapping } from "src/TransitoryMapping.sol";
import { Test, stdStorage, console, StdStorage, stdError } from "@forge-std/Test.sol";

contract TransitoryMappingTest is Test {
    TransitoryMapping private con;

    uint256 num;

    function setUp() public {
        con = new TransitoryMapping();
        con.transitoryStore(vm.addr(1), 0);
    }

    function testTransitoryMapping() external {
        con.transitoryStore(vm.addr(1), 200);
    }

    function testDoArrayWork() external {
        uint256[8] memory arr = [uint256(0), 0, 0, 0, 0, 0, 0, 0];
        uint256 gas = gasleft();
        con.doArrayWork(arr);
        console.log("Gas used", gas - gasleft());
    }

    function testDoNumberWork() external {
        uint256 num = 7;
        num = con.doNumberWork(num);

        console.log("Number Value", num);
    }

    function testArrayCopy() external {
        uint256[8] memory arr;
        uint256 gas = gasleft();
        con.arrayCopy(arr);
        console.log("Gas used", gas - gasleft());
    }

    function testNumberCopy() external {
        uint256 num = 7;
        uint256 gas = gasleft();
        con.numberCopy(num);
        console.log("Gas used", gas - gasleft());
    }

    function testHunch() external {
        uint256 gas = gasleft();
        con.hunch();
        console.log("Gas used", gas - gasleft());
    }
}
