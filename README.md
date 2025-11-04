<<<<<<< HEAD
# ASM_SWD
SWD assignment
=======
# 🧁 Online Shopping for Baking Ingredients System

A full-stack e-commerce web application for buying baking ingredients and tools online. Built with **React**, **Express**, **MySQL**, and **JWT Authentication**.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [API Documentation](#api-documentation)
- [User Roles](#user-roles)
- [Screenshots](#screenshots)

## ✨ Features

### Customer Features
- 🔐 User Registration & Login (JWT Authentication)
- 🔍 Browse and search products by name, category, brand
- 🛒 Shopping cart management (add, remove, update quantity)
- 💳 Checkout with multiple payment methods (COD, VNPay, MoMo)
- 📦 Order tracking (Pending → Shipping → Delivered)
- ⭐ Product reviews and ratings
- 👤 Profile management

### Admin Features
- 📊 Admin dashboard
- ➕ Product management (CRUD operations)
- 📋 Order management and status updates
- 👥 View customer information

## 🛠️ Tech Stack

### Frontend
- **React 18** - UI Library
- **React Router v6** - Routing
- **React Bootstrap** - UI Components
- **Axios** - HTTP Client
- **React Toastify** - Notifications
- **Context API** - State Management

### Backend
- **Node.js** - Runtime Environment
- **Express.js** - Web Framework
- **MySQL** - Database
- **Sequelize** - ORM
- **JWT** - Authentication
- **bcryptjs** - Password Hashing

## 💻 System Requirements

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

## 📥 Installation

### 1. Clone the repository

```bash
git clone <repository-url>
cd ASM_SWD
```

### 2. Install dependencies

```bash
npm run install-all
```

This will install dependencies for both backend and frontend.

Alternatively, install manually:

```bash
# Install backend dependencies
cd backend
npm install

# Install frontend dependencies
cd ../frontend
npm install
```

## 🗄️ Database Setup

### 1. Create MySQL Database

Make sure MySQL is running, then execute:

```bash
mysql -u root -p
```

### 2. Run the SQL script

```bash
mysql -u root -p < backend/database.sql
```

Or manually execute the SQL commands in `backend/database.sql` using MySQL Workbench or command line.

### 3. Configure Environment Variables

Create a `.env` file in the `backend` directory:

```bash
cd backend
cp .env.example .env
```

Edit `.env` with your MySQL credentials:

```env
PORT=5000
NODE_ENV=development

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=baking_shop
DB_PORT=3306

JWT_SECRET=your_super_secret_jwt_key_change_this_in_production

CLIENT_URL=http://localhost:3000
```

## 🚀 Running the Application

### Run both backend and frontend concurrently:

```bash
npm run dev
```

### Or run separately:

**Backend** (port 5000):
```bash
cd backend
npm run dev
```

**Frontend** (port 3000):
```bash
cd frontend
npm start
```

The application will open at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000/api

## 📁 Project Structure

```
ASM_SWD/
├── backend/
│   ├── config/
│   │   └── database.js          # Database configuration
│   ├── controllers/
│   │   ├── authController.js    # Authentication logic
│   │   ├── productController.js # Product CRUD
│   │   ├── orderController.js   # Order management
│   │   └── feedbackController.js # Reviews
│   ├── middleware/
│   │   ├── auth.js              # JWT middleware
│   │   └── errorHandler.js      # Error handling
│   ├── models/
│   │   ├── User.js              # User model
│   │   ├── Product.js           # Product model
│   │   ├── Order.js             # Order model
│   │   ├── OrderItem.js         # Order items
│   │   ├── Category.js          # Category model
│   │   ├── Feedback.js          # Feedback model
│   │   └── index.js             # Model associations
│   ├── routes/
│   │   ├── authRoutes.js        # Auth endpoints
│   │   ├── productRoutes.js     # Product endpoints
│   │   ├── orderRoutes.js       # Order endpoints
│   │   └── feedbackRoutes.js    # Feedback endpoints
│   ├── database.sql             # Database schema & seed data
│   ├── server.js                # Express server
│   ├── package.json
│   └── .env.example
│
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── api/
│   │   │   └── axios.js         # API configuration
│   │   ├── components/
│   │   │   ├── Navbar.js        # Navigation bar
│   │   │   ├── ProductCard.js   # Product display
│   │   │   ├── Loader.js        # Loading spinner
│   │   │   └── PrivateRoute.js  # Protected routes
│   │   ├── context/
│   │   │   ├── AuthContext.js   # Auth state
│   │   │   └── CartContext.js   # Cart state
│   │   ├── pages/
│   │   │   ├── Home.js          # Home page
│   │   │   ├── ProductDetails.js # Product details
│   │   │   ├── Cart.js          # Shopping cart
│   │   │   ├── Checkout.js      # Checkout page
│   │   │   ├── Login.js         # Login/Register
│   │   │   ├── Profile.js       # User profile
│   │   │   ├── Orders.js        # Order history
│   │   │   └── AdminDashboard.js # Admin panel
│   │   ├── App.js               # Main app component
│   │   ├── index.js             # React entry point
│   │   └── index.css            # Global styles
│   └── package.json
│
├── package.json                 # Root package.json
└── README.md
```

## 📡 API Documentation

### Authentication Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/auth/register` | Register new user | No |
| POST | `/api/auth/login` | Login user | No |
| GET | `/api/auth/profile` | Get user profile | Yes |
| PUT | `/api/auth/profile` | Update user profile | Yes |

### Product Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/products` | Get all products (with filters) | No |
| GET | `/api/products/:id` | Get product by ID | No |
| GET | `/api/products/categories` | Get all categories | No |
| POST | `/api/products` | Create product | Admin |
| PUT | `/api/products/:id` | Update product | Admin |
| DELETE | `/api/products/:id` | Delete product | Admin |

### Order Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/orders` | Create new order | Yes |
| GET | `/api/orders/myorders` | Get user's orders | Yes |
| GET | `/api/orders/:id` | Get order by ID | Yes |
| GET | `/api/orders` | Get all orders | Admin |
| PUT | `/api/orders/:id/status` | Update order status | Admin |

### Feedback Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/feedbacks` | Create product review | Yes |
| GET | `/api/feedbacks/product/:productId` | Get product reviews | No |
| PUT | `/api/feedbacks/:id` | Update review | Yes |
| DELETE | `/api/feedbacks/:id` | Delete review | Yes/Admin |

## 👥 User Roles

### Demo Accounts

**Admin Account:**
- Username: `admin`
- Password: `admin123`
- Access: Full admin dashboard, product & order management

**Customer Account:**
- Username: `customer1`
- Password: `customer123`
- Access: Browse, cart, checkout, orders, reviews

### Role Permissions

**Customer:**
- Browse and search products
- Add products to cart
- Place orders
- View order history
- Submit product reviews
- Update profile

**Admin:**
- All customer permissions
- Create, update, delete products
- View all orders
- Update order status
- Delete any reviews

## 🔐 Security Features

- JWT-based authentication
- Password hashing with bcryptjs
- Protected routes (frontend & backend)
- Role-based access control
- SQL injection prevention (Sequelize ORM)
- CORS configuration

## 🎨 UI Features

- Responsive design (mobile-friendly)
- Bootstrap components
- Toast notifications
- Loading states
- Form validation
- Search and filter functionality
- Category filtering

## 🔄 Workflow

1. **Customer Registration/Login** → Customers create accounts or log in
2. **Browse Products** → View products, search, filter by category
3. **Add to Cart** → Select products and quantities
4. **Checkout** → Choose payment method (COD/VNPay/MoMo)
5. **Order Placed** → Order status: Pending
6. **Admin Confirms** → Admin updates status to Shipping
7. **Order Delivered** → Admin marks as Delivered
8. **Customer Reviews** → Customer can rate and review products

## 🐛 Troubleshooting

### Database Connection Error
- Verify MySQL is running
- Check `.env` credentials
- Ensure database `baking_shop` exists

### Port Already in Use
- Backend: Change `PORT` in `.env`
- Frontend: Set `PORT=3001` before `npm start`

### Dependencies Issues
```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📧 Contact

For questions or support, please open an issue on GitHub.

---

**Happy Baking! 🧁**
>>>>>>> 44d0780 (Initial commit: baking-shop fullstack)
