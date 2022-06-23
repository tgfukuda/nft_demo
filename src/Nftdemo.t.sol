// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Nftdemo.sol";

contract NftdemoTest is DSTest {
    Nftdemo demo;

    function setUp() public {
        demo = new Nftdemo();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
