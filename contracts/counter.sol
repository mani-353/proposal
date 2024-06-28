// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;
contract counter{
    address owner;
    struct Counter{
        uint number;
        string description;
    }
    Counter count;
    modifier byowner{
        require(msg.sender==owner,"only owner have right to modify contract");
        _;
    }
    constructor(uint intial_value,string memory description){
        owner=msg.sender;
        count=Counter(intial_value,description);
    }
    function inc_counter()external byowner{
        count.number+=1;
    }
    function dec_counter()external byowner{
        count.number-=1;
    }
    function get_value()external view returns(uint){
        return count.number;
    }
    function get_desc()external view returns(string memory){
        return count.description;
    }
}


