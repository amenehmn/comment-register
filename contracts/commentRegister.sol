// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";   

contract commentRegister {

    struct Comment {
        address user; 
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Comment[] comments;

    event NewComment(address indexed from, uint256 timestamp, string message);

    constructor() {
        console.log("I AM SMART CONTRACT. POG.");
    }

    function register(string memory _message) public {
        console.log("%s sent w/ message %s", msg.sender, _message);

        /*
         * This is where I actually store the wave data in the array.
         */
        comments.push(Comment(msg.sender, _message, block.timestamp));

        /*
         * I added some fanciness here, Google it and try to figure out what it is!
         * Let me know what you learn in #general-chill-chat
         */
        emit NewComment(msg.sender, block.timestamp, _message);
    }

    function getAllComments() public view returns (Comment[] memory) {
        return comments;
    }

}