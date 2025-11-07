# 🏦 Wallet Transaction Engine

A production-ready backend module for **digital wallet transactions** — built with **Node.js**, **Express**, **Sequelize**, and **MySQL**.  
It supports **secure fund transfers**, **charges**, **commissions**, and **transaction logging**, all within atomic database transactions.

---

## 🚀 Features

- ✅ Create, fetch, and manage user wallets  
- ✅ Transfer money between wallets (P2P, Bill, Recharge, etc.)  
- ✅ Automatic **balance** and **prev_balance** tracking  
- ✅ Configurable **charges**, **commissions**, and **thresholds**  
- ✅ Transaction-safe using Sequelize’s `transaction()`  
- ✅ Error handling with rollback on failure  
- ✅ UUID-based transaction IDs for full traceability  

---

## 🧩 Tech Stack

| Layer | Technology |
|--------|-------------|
| Backend | Node.js, Express.js |
| ORM | Sequelize |
| Database | MySQL |
| UUID | `uuid` npm package |
| Transaction Handling | Sequelize Transaction API |

---

## ⚙️ Installation & Setup

### 1️⃣ Clone Repository
```bash
git clone https://github.com/your-username/wallet-transaction-engine.git
cd wallet-transaction-engine

## 🔐 Transaction Flow

**Validate sender & receiver wallets**
**Validate service type & thresholds**
**Lock both wallets for update (FOR UPDATE)**
**Deduct sender amount + charge**
**Credit receiver amount + commission**
**Log both DEBIT and CREDIT transactions**
**Commit on success or rollback on failure**


## 👨‍💻 Author  

**Ravi Shankar Singh**  
📧 Email: [ravishankar.singh.backend@gmail.com](mailto:ravishankar.singh.backend@gmail.com)  
📱 Mobile: +91 9871585013  
🔗 [LinkedIn](https://www.linkedin.com/in/ravishankarsinghsde/)  


📜 License
Licensed under the MIT License — free for commercial or personal use.
