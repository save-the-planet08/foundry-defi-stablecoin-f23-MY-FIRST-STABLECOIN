# StableCoin Project

Author: Frederik Pietratus (course by Patrick Collins)

## Overview

This project implements a decentralized, algorithmic stablecoin pegged to $1.00 using exogenous collateral. The primary contract, `DSCEngine.sol`, governs the stablecoin system, ensuring stability and maintaining the peg through various mechanisms and functions.

## Features

1. **Pegged to $1.00**: The stablecoin is designed to maintain a 1:1 peg with the US Dollar.
2. **Algorithmic Stability**: The system uses algorithms to ensure the stablecoin remains stable and retains its peg.
3. **Exogenous Collateral**: The stablecoin is backed by external collateral, ensuring its value and stability.

## Core Contract: `DSCEngine.sol`

### Contract Layout

- **Version**: Solidity ^0.8.19
- **Imports**:
  - `DecentralizedStableCoin.sol`
  - `ReentrancyGuard.sol` (OpenZeppelin)
  - `IERC20.sol` (OpenZeppelin)
  - `AggregatorV3Interface.sol` (Chainlink)
  - `OracleLib.sol`
- **Errors**: Custom errors for various failure conditions
- **State Variables**: Constants, mappings, and other state variables
- **Events**: Events for logging significant actions
- **Modifiers**: Custom modifiers for reusable checks
- **Functions**: Organized into external, public, internal, and private categories

### Key Functions

- **depositCollateralAndMintDsc**: Deposits collateral and mints decentralized stablecoins in a single transaction.
- **depositCollateral**: Deposits a specified amount of collateral.
- **redeemCollateralForDsc**: Burns DSC and redeems the corresponding amount of collateral.
- **mintDsc**: Mints a specified amount of DSC, ensuring the user's collateral value exceeds the minimum threshold.
- **burnDsc**: Burns a specified amount of DSC.
- **liquidate**: Allows liquidation of a user's collateral if their health factor is below the minimum threshold.

### Health Factor

The health factor is a measure of how close a user is to liquidation. It is calculated as follows:

\[ \text{Health Factor} = \frac{\text{Collateral Adjusted Threshold}}{\text{Total DSC Minted}} \]

If the health factor falls below 1, the user can be liquidated.

### Collateral Value

The contract uses Chainlink price feeds to determine the value of the collateral in USD. The functions `getTokenAmountFromUsd`, `getAccountCollateralValue`, and `getUsdValue` facilitate these calculations.

## Additional Components

This project also includes:

- **Tests**: Comprehensive tests to ensure the stability and security of the system.
- **Scripts**: Automation scripts for deployment and maintenance.
- **Fuzzing**: Tools and configurations for fuzz testing to find edge cases and potential vulnerabilities.
- **OracleLib Library**: A library for interacting with price oracles, ensuring accurate and reliable price data.
- **Stablecoin Contract**: The core stablecoin contract, `DecentralizedStableCoin.sol`, which integrates with `DSCEngine.sol`.

## Getting Started

### Prerequisites

- Node.js
- Hardhat
- Foundry

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/stablecoin-project.git
   cd stablecoin-project
