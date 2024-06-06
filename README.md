# Donation Campaign

## Overview
This Solidity smart contract, named donation, facilitates fundraising campaigns by allowing contributors to donate Ether. It provides functionalities to track total funds raised, manage campaign status, and enable the contract owner to withdraw funds.

## Features
- Campaign Management: The contract owner can activate or deactivate the fundraising campaign.
- Donation: Contributors can donate Ether to the campaign when it is active.
- Funds Tracking: Total funds raised are tracked and accessible to the contract owner.
- Withdrawal: The contract owner can withdraw funds from the contract balance.
  
## Usage
- Deploy Contract: Deploy the donation contract with an initial owner address.
- Activate Campaign: The owner can activate the campaign to start accepting donations.
- Contribute: Contributors can send Ether to the contract address during an active campaign.
- Withdraw Funds: The owner can withdraw funds from the contract balance.


## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```solidity
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile donation.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "donation" contract from the dropdown menu, and then click on the "Deploy" button.


## Authors

Manvitha R Kabbathi
[manvitha.r.kabbathi@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
