// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("Degen", "DGN") {}

    uint256 public constant FLOWER_SHIELD_PRICE = 2000;
    uint256 public constant NATURE_BLAST_PRICE = 1000;
    uint256 public constant DGN_NFT_PRICE = 1500; 

    // Item balances
    mapping(address => uint256) public flowerShield;
    mapping(address => uint256) public natureBlast;
    mapping(address => uint256) public dgnNFTs;

    function mint(address _to, uint256 _value) public onlyOwner {
        _mint(_to, _value);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient DGN Token balance");
        _burn(msg.sender, amount);
    }

    function transferTokens(address _to, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient DGN Token balance");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _to, _value);
    }

    function getBalance() external view returns (uint256){
        return this.balanceOf(msg.sender);
    }

    function redeemTokens(uint256 _itemIndex) external {
        require(_itemIndex >= 1 && _itemIndex <= 3, "Invalid item index");

        // Calculate the token amount based on the item index
        uint256 tokenAmount = 0;
        if (_itemIndex == 1) {
            tokenAmount = FLOWER_SHIELD_PRICE;
        } else if (_itemIndex == 2) {
            tokenAmount = NATURE_BLAST_PRICE;
        } else if (_itemIndex == 3) {
            tokenAmount = DGN_NFT_PRICE;
        }

        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient DGN Token balance");

        if (_itemIndex == 1) {
            flowerShield[msg.sender]++;
        } else if (_itemIndex == 2) {
            natureBlast[msg.sender]++;
        } else if (_itemIndex == 3) {
            dgnNFTs[msg.sender]++;
        }

        _burn(msg.sender, tokenAmount);
    }
}