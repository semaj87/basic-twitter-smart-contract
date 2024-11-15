// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter {

    mapping(address => string[]) public tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    function getTweet(address _ownerAddress, uint _index) public view returns (string memory) {
        return tweets[_ownerAddress][_index];
    }

    function getAllTweets(address _ownerAddress) public view returns (string[] memory) {
        return tweets[_ownerAddress];
    }
}
