// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { BitWiseVsStructs } from "src/BitWiseVsStructs.sol";
import { Test, stdStorage, console, StdStorage, stdError } from "@forge-std/Test.sol";

contract BitWiseVsStructsTest is Test {
    BitWiseVsStructs private con;

    uint256 num;

    function setUp() public {
        con = new BitWiseVsStructs();

        con.setStructInline(100, 10, 1, true);
        con.setNum(1);

        num = con.createStorageForChainlinkDerivative(100, 10, 1, true);
    }

    function testSetStructInline() external {
        con.setStructInline(1001, 101, 11, false);
    }

    function testSetStructValueByValue() external {
        con.setStructValueByValue(1001, 101, 11, false);
    }

    function testSetNum() external {
        con.setNum(num);
    }

    function testGetMyStruct() external {
        con.getMyStruct();
    }

    function testGetMyStructMem() external {
        con.getMyStructMem();
    }

    function testGetMyStructStor() external {
        con.getMyStructStor();
    }

    function testGetNum() external {
        con.getNum();
    }

    function testDoWork() external {
        con.doWorkWithStruct();
    }

    function testDoWorkStor() external {
        con.doWorkWithStructStor();
    }

    function testDoWorkMem() external {
        con.doWorkWithStructMem();
    }
}
