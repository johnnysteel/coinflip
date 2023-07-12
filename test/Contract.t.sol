// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./CoinFlipContract.sol";

contract CoinFlipTest {
    CoinFlip public coinFlipContract;

    constructor(address _coinFlipAddress) {
        coinFlipContract = CoinFlip(_coinFlipAddress);
    }

    function testWinStreak() public {
        bool guess = true;

        for (uint256 i = 0; i < 10; i++) {
            bool result = coinFlipContract.flip(guess);

            // Verify that the guess was correct
            require(result == true, "Incorrect guess");

            // Verify the consecutive win streak count
            require(coinFlipContract.consecutiveWins() == i + 1, "Incorrect win streak count");
        }
    }
}
