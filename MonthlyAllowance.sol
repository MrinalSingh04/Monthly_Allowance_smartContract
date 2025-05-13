// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MonthlyAllowance is Ownable {
    struct Allowance {
        uint256 amount;
        uint256 lastPaid;
    }

    mapping(address => Allowance) public allowances;
    address[] public recipients;

    uint256 public interval = 30 days;

    event AllowanceSet(address indexed recipient, uint256 amount);
    event AllowancePaid(address indexed recipient, uint256 amount, uint256 timestamp);

    constructor() payable {}

    function setAllowance(address _recipient, uint256 _amount) external onlyOwner {
        if (allowances[_recipient].amount == 0) {
            recipients.push(_recipient); // add to recipients only once
        }

        allowances[_recipient] = Allowance({
            amount: _amount,
            lastPaid: block.timestamp
        });

        emit AllowanceSet(_recipient, _amount);
    }

    function payAllowances() external {
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            Allowance storage allowance = allowances[recipient];

            if (block.timestamp >= allowance.lastPaid + interval) {
                require(address(this).balance >= allowance.amount, "Insufficient balance");

                allowance.lastPaid = block.timestamp;
                payable(recipient).transfer(allowance.amount);

                emit AllowancePaid(recipient, allowance.amount, block.timestamp);
            }
        }
    }

    // Allow the contract to receive ETH
    receive() external payable {}

    // Withdraw function for the owner
    function withdraw(uint256 amount) external onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner()).transfer(amount);
    }

    // View function to get recipients
    function getRecipients() external view returns (address[] memory) {
        return recipients;
    }
}
