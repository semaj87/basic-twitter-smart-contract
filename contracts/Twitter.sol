// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter {

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _ownerAddress, uint _index) public view returns (Tweet memory) {
        return tweets[_ownerAddress][_index];
    }

    function getAllTweets(address _ownerAddress) public view returns (Tweet[] memory) {
        return tweets[_ownerAddress];
    }
}
