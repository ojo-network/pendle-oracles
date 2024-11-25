// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {OjoPendleOracle} from "src/OjoPendleOracle.sol";
import {console} from "forge-std/console.sol";

contract DeployOjoPendleOracle is Script {
    function run() external {
        address _pt = vm.envAddress("PT_ADDRESS");
        uint256 _baseDiscountPerYear = vm.envUint("BASE_DISCOUNT_PER_YEAR");

        vm.startBroadcast();

        OjoPendleOracle ojoPendleOracle = new OjoPendleOracle(_pt, _baseDiscountPerYear);

        vm.stopBroadcast();

        console.log("OjoPendleOracle Address:", address(ojoPendleOracle));
    }
}
