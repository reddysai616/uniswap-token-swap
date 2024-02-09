// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomeToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 100000 * 10 ** 18);
    }
}

contract CustomDex {
    string[] public tokens =["usd" ,"matic","eth",""]
    mapping(string => ERC20) public tokenInstanceMap;

    unit256 ethval = 10000000;

    struct History{
        unit256 historyId;
        string tokenA;
        string tokenB;
        unit256 inputValue;
        unit256 outputValue;
        address userAddress;
    }
    unit256 public _historyIndex;
    mapping(unit256 => history) private historys;

    constructor(){
        for(unit i=0; i<tokens.length; i++){
            CustomeToken token = new CustomeToken(tokens[i] , tokens[i]);
            tokenInstanceMap[tokens[i]]=tokens;

        }
    }
    function  getBalance(string memory tokenName , address _address) public view returns (unit256){
        return tokenInstanceMap[tokenName].balanceOf(_address);
    }

    function getTotalSupply(string memory tokenName) public view returns (unit256){
        return tokenInstanceMap[tokenName].totalSupply();

    }

    function getName(string memory tokenName) public view returns (string memory){
        return tokenInstanceMap[tokenName].name();
    }

    function getTokenAddress(string memory tokenName) public view returns (address){
        return address(tokenInstanceMap[tokenName]);
    }

    function getBalance() public view returns (uint256){
        return address(this).balance;
    }

function _transactionHistory(string memory tokenName , string memory etherToken , unit256 inputValue, unit256 outputValue) internal {
    _historyIndex++;
    unit256 _historyId = _historyIndex;
    History storage history = historys[_historyId];
    history.userAddress = msg.sender;
    history.tokenA = tokenName;
    history.tokenB = etherToken;
    history.inputValue = inputValue;
    history.outputValue = outputValue;

}



}
