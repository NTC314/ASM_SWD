# Quick Start Guide

## ⚡ Quick Setup (5 minutes)

### Step 1: Database Setup

1. Make sure MySQL is installed and running
2. Open MySQL command line or MySQL Workbench
3. Run the following commands:

```sql
CREATE DATABASE baking_shop;
USE baking_shop;
SOURCE backend/database.sql;
```

Or from command line:
```bash
mysql -u root -p < backend/database.sql
```

### Step 2: Configure Database Connection

Edit `backend/.env` file and update your MySQL password:

```env
DB_PASSWORD=your_mysql_password_here
```

### Step 3: Run the Application

From the root directory:

```bash
npm run dev
```

This will start:
- Backend API on http://localhost:5000
- Frontend on http://localhost:3000

### Step 4: Login

**Admin Account:**
- Username: `admin`
- Password: `admin123`

**Customer Account:**
- Username: `customer1`
- Password: `customer123`

## 🎯 What to Test

1. **Browse Products** - View products on home page, search, filter by category
2. **Product Details** - Click on a product to see details and reviews
3. **Shopping Cart** - Add products to cart, update quantities
4. **Checkout** - Complete an order (login required)
5. **Orders** - View order history
6. **Reviews** - Add product reviews (login required)
7. **Admin Dashboard** - Login as admin to manage products and orders

## 🐛 Common Issues

**MySQL Connection Error:**
- Verify MySQL is running
- Check DB_PASSWORD in backend/.env
- Ensure baking_shop database exists

**Port 5000 already in use:**
- Change PORT in backend/.env to 5001

**Port 3000 already in use:**
- Frontend will prompt to use port 3001

## 📝 API Health Check

Visit http://localhost:5000/api/health to verify backend is running.

## 🔄 Reset Database

To reset the database with fresh data:

```bash
mysql -u root -p baking_shop < backend/database.sql
```

---

Enjoy building with the Baking Shop! 🧁
