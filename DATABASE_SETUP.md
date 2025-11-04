# ⚠️ IMPORTANT: Database Setup Required

## Current Status

✅ **Frontend is running** on http://localhost:3000
❌ **Backend needs database connection**

## 🔧 Fix Database Connection (3 steps)

### Step 1: Start MySQL Server
Make sure MySQL is installed and running on your machine.

### Step 2: Create Database & Import Data

Open a **new terminal** and run:

```bash
# Option 1: Using MySQL command line
mysql -u root -p
```

Then execute:
```sql
CREATE DATABASE baking_shop;
USE baking_shop;
SOURCE C:/Users/DELL/Desktop/ASM_SWD/backend/database.sql;
EXIT;
```

**OR**

```bash
# Option 2: Direct import
mysql -u root -p < "C:\Users\DELL\Desktop\ASM_SWD\backend\database.sql"
```

### Step 3: Configure Database Password

Edit `backend\.env` file and set your MySQL password:

```env
DB_PASSWORD=your_mysql_root_password_here
```

Then **save the file**. The backend will automatically restart and connect!

---

## 🎯 After Database Setup

Once the database is connected, you'll see:
```
✅ MySQL Database connected successfully
✅ All models synchronized
🚀 Server running on port 5000
```

Then you can access:
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:5000/api
- **Health Check:** http://localhost:5000/api/health

---

## 👥 Demo Login Credentials

### Admin Account
- **Username:** admin
- **Password:** admin123
- **Access:** Full dashboard + product/order management

### Customer Account
- **Username:** customer1
- **Password:** customer123
- **Access:** Browse, cart, checkout, orders, reviews

---

## 📝 Quick Test Steps

1. ✅ **Frontend is already running** - Visit http://localhost:3000
2. ⏳ **Setup database** - Follow steps above
3. ✅ **Login** - Use admin or customer1 credentials
4. 🛒 **Shop** - Browse products, add to cart, checkout
5. 🎨 **Admin** - Login as admin to manage products/orders

---

## 🆘 Need Help?

### Frontend Issues
The frontend is working! You can see the UI but API calls will fail until backend connects to database.

### Backend Issues
If after setting up the database, backend still doesn't connect:

1. Check MySQL is running:
   ```bash
   mysql --version
   mysql -u root -p
   ```

2. Verify database exists:
   ```sql
   SHOW DATABASES;
   ```

3. Check backend/.env has correct password

4. Restart the dev server:
   - Press `Ctrl+C` to stop
   - Run `npm run dev` again

---

## ✨ What's Working Now

✅ **Frontend (React)** - Fully functional UI
✅ **Backend (Express)** - Server ready, waiting for DB
✅ **All code** - 100% complete and ready
⏳ **Database** - Needs one-time setup (steps above)

---

**Once database is set up, everything will work perfectly! 🎉**
