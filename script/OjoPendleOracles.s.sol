// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {OjoPendleOracle} from "src/OjoPendleOracle.sol";
import {OjoPTOraclePriceAdapter} from "src/OjoPTOraclePriceAdapter.sol";
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

contract DeployOjoPTOraclePriceAdapter is Script {
    function run() external {
        address _ptoracle = vm.envAddress("PT_ORACLE");
        address _market = vm.envAddress("MARKET");
        string memory _description = vm.envString("DESCRIPTION");

        vm.startBroadcast();

        OjoPTOraclePriceAdapter ojoPTOraclePriceAdapter = new OjoPTOraclePriceAdapter(_ptoracle, _market, _description);

        vm.stopBroadcast();

        console.log("OjoPTOraclePriceAdapter Address:", address(ojoPTOraclePriceAdapter));
    }
}
