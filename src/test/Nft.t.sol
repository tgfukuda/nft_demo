// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "../Nft.sol";

contract NftTest is DSTest {
    Nft demo;

    function setUp() public {
        demo = new Nft("dummy", "DUM");
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
