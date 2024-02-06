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
    function  getBalance(string memory tokenNAme , address _address) public view returns (unit256){
        return tokenInstanceMap[tokenNAme].balanceOf(_address);
    }

    function getTotalSupply(string memory tokenName) public view returns (unit256){
        return tokenInstanceMap[tokenName].totalSupply();

    }


}
