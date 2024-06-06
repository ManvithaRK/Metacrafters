//SPDX-License-Identifer:MIT
pragma solidity ^0.8.9;

contract donation{

    address owner;
    bool public campaign_active;
    uint public totalFunds;
    address[] public contributors;

    constructor(address initOwner){
        owner=initOwner;
        campaign_active=false;
    }

    function donate()public payable{
        require(campaign_active==true,"Campaign is not active! Cannot donate ");
        assert(msg.value>0);
        totalFunds+=msg.value;
        contributors.push(msg.sender);
        
    }

    function withdraw(uint amount)public {
        require(msg.sender==owner);
        if(amount>address(this).balance){
            revert("Not enough funds available to withdraw");
        }
        payable(owner).transfer(amount*10**18);
    }

    function changeCampaignStatus()public {
        campaign_active=!campaign_active;
    }
}
