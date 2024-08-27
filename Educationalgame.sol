// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EducationalGame {
    struct Question {
        string question;
        string[] options;
        uint correctOptionIndex;
    }

    Question[] public questions;
    mapping(address => uint) public userScores;

    // Add a new question to the game (only admin)
    function addQuestion(string memory _question, string[] memory _options, uint _correctOptionIndex) public {
        questions.push(Question({
            question: _question,
            options: _options,
            correctOptionIndex: _correctOptionIndex
        }));
    }

    // Answer a question and update the user's score
    function answerQuestion(uint _questionIndex, uint _optionIndex) public {
        require(_questionIndex < questions.length, "Question does not exist");
        
        if (_optionIndex == questions[_questionIndex].correctOptionIndex) {
            userScores[msg.sender] += 1; // Correct answer, increase score
        }
    }

    // Get the score of a user
    function getUserScore(address _user) public view returns (uint) {
        return userScores[_user];
    }

    // Get a question
    function getQuestion(uint _questionIndex) public view returns (string memory question, string[] memory options) {
        require(_questionIndex < questions.length, "Question does not exist");
        return (questions[_questionIndex].question, questions[_questionIndex].options);
    }
}

