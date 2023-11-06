// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";

contract TestBasicNft is Test {
    DeployBasicNft public deployer;
    BasicNft public nft;
    address public user = makeAddr("user");
    string public constant PUG_URI =
        "https://ipfs.io/ipfs/QmXik3xeQVbNtSfNNccNtBnKGMBZWnatwAKPWZmsdVy755?filename=bulldog.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        nft = deployer.run();
    }

    function testNameisCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = nft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(user);
        nft.mintNft(PUG_URI);
        assert(nft.balanceOf(user) == 1);
    }

    function testCanCreateNft () public {
        vm.prank(user);
        
    }
}
