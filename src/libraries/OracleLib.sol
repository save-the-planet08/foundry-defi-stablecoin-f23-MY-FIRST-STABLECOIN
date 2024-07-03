// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title OracleLib
 * @dev Library for Oracle contract
 * @notice This libary is used to check the Chainlink Oracle for stale data.
 * If a price is stale, the function will revert, and render DSCEngie unusable.
 */

library OracleLib {
  error OracleLib__StalePrice();
  uint256 private constant TIMEOUT = 3 hours;
    
    function staleCheckLatestRoundData(AggregatorV3Interface priceFeed) public view returns(uint80,
    int256, uint256, uint256, uint80){
        (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    ) = priceFeed.latestRoundData();

    uint256 secondsSinceUpdate = block.timestamp - updatedAt;
    if (secondsSinceUpdate > TIMEOUT) revert OracleLib__StalePrice();
      return (roundId, answer, startedAt, updatedAt, answeredInRound);
    
}
}