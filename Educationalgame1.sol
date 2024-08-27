// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solitaire {
    struct Game {
        uint256 score;
        bool isActive;
    }

    mapping(address => Game) public games;

    // Start a new game
    function startGame() public {
        require(!games[msg.sender].isActive, "Game already in progress");
        games[msg.sender] = Game({
            score: 0,
            isActive: true
        });
    }

    // Play a round (simplified)
    function playRound(uint256 points) public {
        require(games[msg.sender].isActive, "No active game");
        games[msg.sender].score += points;
    }

    // End the game and get the final score
    function endGame() public {
        require(games[msg.sender].isActive, "No active game");
        games[msg.sender].isActive = false;
    }

    // Get the current score of the player
    function getScore() public view returns (uint256) {
        return games[msg.sender].score;
    }
}
