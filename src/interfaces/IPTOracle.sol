// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

interface IPTOracle {
    function getPtToAssetRate(address market, uint32 duration) external view returns (uint256);
}
