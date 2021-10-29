// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract OwnerPausable is Pausable, Ownable, ReentrancyGuard {
    function pause() public onlyOwner {
        super._pause();
    }

    function unpause() public onlyOwner {
        super._unpause();
    }
}

interface ITestToken {
    function mint(address to, uint256 amount) external;
}

contract SuperHero is ERC721, OwnerPausable {
    using Address for address;
    using EnumerableSet for EnumerableSet.AddressSet;

    enum Level {
        Low,
        Mid,
        High
    }

    struct Hero {
        string name;
        uint256 age;
        Level level;
    }

    Hero[] public heroes;

    ITestToken public testToken;

    EnumerableSet.AddressSet users;

    modifier NotContract() {
        require(!Address.isContract(msg.sender), "SuperHero: not contract");
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        address _testToken
    ) ERC721(name, symbol) {
        require(_testToken != address(0), "SuperHero: _testToken address zero");
        testToken = ITestToken(_testToken);

        Hero memory zeroHero = Hero({
            name: "",
            age: uint256(0),
            level: Level.Low
        });
        heroes.push(zeroHero);
    }

    function mint(string memory name, uint256 age)
        public
        NotContract
        nonReentrant
        whenNotPaused
    {
        Hero memory hero = Hero({name: name, age: age, level: Level.Low});
        heroes.push(hero);

        uint256 tokenId = heroes.length - 1;
        _mint(msg.sender, tokenId);

        if (!users.contains(msg.sender)) {
            testToken.mint(msg.sender, 10 ether);
            users.add(msg.sender);
        }
    }

    function setTestToken(address _token) public onlyOwner {
        require(_token != address(0), "SuperHero: _testToken address zero");
        testToken = ITestToken(_token);
    }
}
