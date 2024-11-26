// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.8.19;

import {IPTOracle} from "./interfaces/IPTOracle.sol";
import {MinimalAggregatorV3Interface} from "./interfaces/MinimalAggregatorV3Interface.sol";

contract OjoPTOraclePriceAdapter is MinimalAggregatorV3Interface {
    uint8 public constant decimals = 18;

    address public immutable PTOracle;

    address public immutable market;

    string public description;

    constructor(address _ptoracle, address _market, string memory _description) {
        require(_ptoracle != address(0), "_ptoracle zero address");
        require(_market != address(0), "_market zero address");

        PTOracle = _ptoracle;
        market = _market;
        description = _description;
    }

    /// @inheritdoc MinimalAggregatorV3Interface
    /// @dev Returns zero for roundId, startedAt, updatedAt and answeredInRound.
    /// @dev Silently overflows if `price`'s average is greater than `type(int256).max`.
    function latestRoundData() external view returns (uint80, int256, uint256, uint256, uint80) {
        IPTOracle oracle = IPTOracle(PTOracle);

        uint256 price = oracle.getPtToAssetRate(
            market,
            900 // 15 mins twap duration
        );

        return (0, int256(price), 0, 0, 0);
    }
}