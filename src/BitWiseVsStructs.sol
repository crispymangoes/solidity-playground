// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import { console } from "@forge-std/Test.sol";

contract BitWiseVsStructs {
    struct MyStruct {
        uint144 max;
        uint80 min;
        uint24 heartbeat;
        bool inETH;
    }

    MyStruct public myStruct;

    uint256 public myNum;

    function setStructInline(
        uint144 max,
        uint80 min,
        uint24 heartbeat,
        bool inETH
    ) public {
        myStruct = MyStruct({ max: max, min: min, heartbeat: heartbeat, inETH: inETH });
    }

    function setStructValueByValue(
        uint144 max,
        uint80 min,
        uint24 heartbeat,
        bool inETH
    ) public {
        myStruct.max = max;
        myStruct.min = min;
        myStruct.heartbeat = heartbeat;
        myStruct.inETH = inETH;
    }

    function setNum(uint256 num) public {
        myNum = num;
    }

    function getMyStruct()
        public
        view
        returns (
            uint144,
            uint80,
            uint24,
            bool
        )
    {
        return (myStruct.max, myStruct.min, myStruct.heartbeat, myStruct.inETH);
    }

    function getMyStructMem()
        public
        view
        returns (
            uint144,
            uint80,
            uint24,
            bool
        )
    {
        MyStruct memory tmp = myStruct;
        return (tmp.max, tmp.min, tmp.heartbeat, tmp.inETH);
    }

    function getMyStructStor()
        public
        view
        returns (
            uint144,
            uint80,
            uint24,
            bool
        )
    {
        MyStruct storage tmp = myStruct;
        return (tmp.max, tmp.min, tmp.heartbeat, tmp.inETH);
    }

    function getNum()
        public
        view
        returns (
            uint144,
            uint80,
            uint24,
            bool
        )
    {
        return _readStorageForChainlinkDerivative(myNum);
    }

    function _readStorageForChainlinkDerivative(uint256 _storage)
        internal
        pure
        returns (
            uint144 max,
            uint80 min,
            uint24 heartbeat,
            bool inETH
        )
    {
        max = uint144(_storage >> 112);
        min = uint80(_storage >> 32);
        heartbeat = uint24(_storage >> 8);
        inETH = uint8(_storage) == 1;
    }

    function createStorageForChainlinkDerivative(
        uint144 _max,
        uint80 _min,
        uint24 _heartbeat,
        bool _inETH
    ) public pure returns (uint256 _storage) {
        _storage |= uint256(_max) << 112;
        _storage |= uint256(_min) << 24;
        _storage |= uint256(_heartbeat) << 8;
        _storage |= uint256(_inETH ? 1 : 0);
    }

    function doWorkWithStruct() public returns (uint256 sum) {
        sum = myStruct.max;
        sum += myStruct.max;
        sum += myStruct.max;
        sum += myStruct.max;
        sum += myStruct.max;
        sum += myStruct.max;
        sum += myStruct.min;
        sum += myStruct.heartbeat;

        myStruct.max = uint144(sum);
    }

    function doWorkWithStructStor() public returns (uint256 sum) {
        MyStruct storage s = myStruct;

        sum = s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.min;
        sum += s.heartbeat;

        s.max = uint144(sum);
    }

    function doWorkWithStructMem() public returns (uint256 sum) {
        MyStruct memory s = myStruct;

        sum = s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.max;
        sum += s.min;
        sum += s.heartbeat;

        myStruct.max = uint144(sum);
    }
}
