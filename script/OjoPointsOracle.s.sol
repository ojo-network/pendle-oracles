// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {OjoPointsOracle} from "src/OjoPointsOracle.sol";
import {console} from "forge-std/console.sol";

contract DeployOjoPointsOracle is Script {
    function run() external {
        address _pt = vm.envAddress("PT_ADDRESS");
        uint256 _baseDiscountPerYear = vm.envUint("BASE_DISCOUNT_PER_YEAR");

        vm.startBroadcast();

        OjoPointsOracle ojoPointsOracle = new OjoPointsOracle(_pt, _baseDiscountPerYear);

        vm.stopBroadcast();

        console.log("OjoPointsOracle Address:", address(ojoPointsOracle));
    }
}
