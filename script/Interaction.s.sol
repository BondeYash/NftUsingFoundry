// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "https://ipfs.io/ipfs/QmXik3xeQVbNtSfNNccNtBnKGMBZWnatwAKPWZmsdVy755?filename=bulldog.json";

    function run() public  {
        vm.startBroadcast();
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentDeploy);
        vm.stopBroadcast();
    }

    function mintNftOnContract(address contractAddress) public {
        BasicNft(contractAddress).mintNft(PUG_URI);
    }
}
