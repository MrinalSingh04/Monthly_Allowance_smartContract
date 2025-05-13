# 💸 Monthly Allowance Smart Contract

A secure and automated Ethereum smart contract for distributing **monthly allowances** (in ETH) to predefined recipients like children, employees, or any dependents.

---

## 📌 What is This?

This smart contract allows an **owner** (you) to set monthly ETH allowances for a list of recipients. Once configured, the contract can **distribute ETH automatically every 30 days** per recipient via a `payAllowances()` function.

It includes:
- 💰 ETH-based allowance transfers
- 🔒 Role-based access (`Ownable` by OpenZeppelin)
- ⏱️ Time-lock logic (30-day intervals)
- ⚡ Gas-efficient batch payment system
- ✅ Manual or automated triggering (e.g., Chainlink Keepers, Cron job + bot)

---

## 🧠 Why Build This?

Traditional payment systems require manual tracking and execution of regular transfers, which is inefficient and error-prone. This smart contract:
- **Automates regular payments** to family members or staff
- **Reduces operational overhead**
- **Ensures transparency** and auditability on-chain
- Is a **practical real-world use case** demonstrating time locks, access control, and batch execution in Solidity

---

## 🚀 Features

| Feature                    | Description |
|---------------------------|-------------|
| ✅ Set Allowances          | Owner can assign ETH amounts to addresses. |
| ⏳ Monthly Time Lock       | Payments happen only after 30 days from the last payment. |
| 🧑‍💼 Role-Based Access     | Only the contract owner can manage allowances or withdraw ETH. |
| ⚙️ Batch Payouts           | Processes all eligible payments in one transaction. |
| 💵 ETH Deposits & Withdrawals | Contract can hold and manage ETH balances. |

---

## 🔐 Security Considerations

- Only the **contract owner** can set/update allowances and withdraw funds.
- The contract checks for **sufficient balance** before sending payments.
- Uses **modifiers and OpenZeppelin Ownable** for access restriction.
- Payments are **time-locked** to avoid repeated withdrawals.

---

## 📃 License

MIT — free to use and modify with credit.

