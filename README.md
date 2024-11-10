# Decentralized Task Marketplace with Solana-Powered Payments

### A Web3 SaaS platform for decentralized task management, enabling users to post tasks and get them completed globally with seamless blockchain-powered payments.

---

## 🚀 What It Does

This platform revolutionizes the way tasks are posted and completed by leveraging **Solana** blockchain for decentralized, transparent, and low-fee payments. Users from anywhere in the world can post tasks like data labeling or finding the best YouTube thumbnail. Other users from around the globe can complete these tasks and get rewarded with Solana.

### 🌟 Key Features
- **Decentralized Payment System**: Task payments are made with **Solana**, ensuring low transaction fees and transparency.
- **Global Task Participation**: Anyone can post tasks, and workers from around the world can complete them.
- **Secure Web3 Wallet Integration**: Users can connect their **Phantom wallet** or any other Web3 wallet for payments.
- **Robust Backend**: Built using **Prisma** and **PostgreSQL**, deployed on **Amazon EC2** for scalability and performance.
- **Fast Content Delivery**: Leveraging **AWS CDNs** for rapid image delivery and task processing.

---

## 🛠️ How It Works

1. **Posting a Task**
   - A user connects their **Web3 wallet** (e.g., Phantom) to the platform.
   - They post a task, such as selecting the best YouTube thumbnail from a set of images.
   - They pay using **Solana**, which is deducted from their wallet.

   ![image](https://github.com/user-attachments/assets/7d9a6e57-d21f-425f-8221-188066d93e7b)


   ![image](https://github.com/user-attachments/assets/7d44c2bf-e9ba-4b4d-8472-cf0e5b989e47)

   - Neon DB (postgres) updated:
     ![image](https://github.com/user-attachments/assets/1e606ad3-624f-4f11-b7b4-028764c808a7)

2. **Completing a Task**
   - Workers from different parts of the world view the tasks available.
   - They connect their wallet, complete the task, and get paid in **Solana**.

   ![image](https://github.com/user-attachments/assets/6882e12f-a58a-434c-bf7b-908d8c02befd)


3. **Getting Paid**
   - Once the task is completed, the worker's wallet is credited with the payment in **Solana**.

---

## 🔑 Why It’s Useful

- **For Task Creators**: Post tasks that require human intelligence (e.g., data labeling) and get them completed quickly and efficiently.
- **For Workers**: Earn Solana by completing tasks, with instant, secure, and decentralized payments.
- **For Everyone**: Lower transaction fees, faster payments, and transparent interactions through blockchain technology.

---

## 🧩 Setup and Requirements

To get the platform up and running, you'll need the following:

### Prerequisites

- **Amazon AWS Access Key** and **Secret Key** (for S3 image storage)
- **CDN** setup on AWS (for fast content delivery)
- **NeonDB PostgreSQL** connection string
- **Alchemy RPC URL** (for blockchain payments)
- **Parent Wallet Private Key** (to handle payments)
- **Web3 Wallet** (e.g., Phantom for Solana transactions)

---

### Installation Instructions

1. **Backend Setup** (located in `backend` folder):
   - Install dependencies using `npm install`
   - Set up **Prisma** for database access with PostgreSQL (use NeonDB connection string)
   - Start the backend with `npm run start`

2. **User Frontend** (located in `user-frontend` folder):
   - Install dependencies using `npm install`
   - Set up environment variables for **AWS S3** and **Solana wallet**
   - Run the frontend with `npm run dev`

3. **Worker Frontend** (located in `worker-frontend` folder):
   - Install dependencies using `npm install`
   - Configure the **Web3 Wallet** for worker payments
   - Run the frontend with `npm run dev`

---

## 🛠️ Dependencies

- **Solana** Blockchain
- **Web3.js** for wallet and payment integration
- **Next.js** for frontend development
- **AWS S3** for image storage
- **Prisma** for database ORM
- **PostgreSQL** (NeonDB) for data storage
- **Phantom Wallet** or any compatible Web3 wallet for Solana payments

---

## 🚀 Future Enhancements

- Support for multiple blockchain payment options
- Adding more task types beyond data labeling
- Real-time notifications for task updates and payments

---

Feel free to contribute or reach out with any questions!

