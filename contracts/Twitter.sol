// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter {

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet) <= MAX_TWEET_LENGTH, "Your Tweet was too long!");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "The Tweet does not exist");
        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "The Tweet does not exist");
        require(tweets[author][id].likes > 0, "The Tweet has no likes");
        tweets[author][id].likes--;
    }

    function getTweet(uint _index) public view returns (Tweet memory) {
        return tweets[msg.sender][_index];
    }

    function getAllTweets(address _ownerAddress) public view returns (Tweet[] memory) {
        return tweets[_ownerAddress];
    }
}
