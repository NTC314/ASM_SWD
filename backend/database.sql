-- Create Database
CREATE DATABASE IF NOT EXISTS baking_shop;
USE baking_shop;

-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100),
  role ENUM('customer','admin') DEFAULT 'customer',
  address VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Categories Table
CREATE TABLE IF NOT EXISTS categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  price DECIMAL(10,2),
  brand VARCHAR(50),
  category_id INT,
  image VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Create Orders Table
CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  total_price DECIMAL(10,2),
  status ENUM('Pending','Shipping','Delivered') DEFAULT 'Pending',
  payment_method ENUM('VNPay','MoMo','COD'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create Order Items Table
CREATE TABLE IF NOT EXISTS order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Create Feedbacks Table
CREATE TABLE IF NOT EXISTS feedbacks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insert Sample Categories
INSERT INTO categories (name) VALUES
('Flour'),
('Butter & Dairy'),
('Chocolate'),
('Baking Tools'),
('Ovens');

-- Insert Sample Products
INSERT INTO products (name, description, price, brand, category_id, image) VALUES
('All-purpose Flour', 'High quality flour for baking cakes and bread', 2.50, 'Meizan', 1, 'flour.jpg'),
('Unsalted Butter', 'Pure dairy butter perfect for baking', 4.00, 'Anchor', 2, 'butter.jpg'),
('Dark Chocolate Chips', '70% cocoa dark chocolate chips', 5.20, 'Lindt', 3, 'choco.jpg'),
('Mixing Bowl Set', 'Stainless steel baking bowl set (3 pieces)', 12.50, 'KitchenPro', 4, 'bowl.jpg'),
('Electric Oven 32L', 'Compact oven for home baking with temperature control', 80.00, 'Panasonic', 5, 'oven.jpg'),
('Cake Flour', 'Fine textured flour for delicate cakes', 3.00, 'Meizan', 1, 'cakeflour.jpg'),
('Heavy Cream', 'Rich cream for whipping and baking', 3.50, 'Anchor', 2, 'cream.jpg'),
('White Chocolate', 'Premium white chocolate for melting', 4.80, 'Lindt', 3, 'whitechoco.jpg'),
('Silicone Spatula Set', 'Heat-resistant spatulas (5 pieces)', 8.00, 'KitchenPro', 4, 'spatula.jpg'),
('Stand Mixer', 'Professional stand mixer 5L capacity', 150.00, 'KitchenAid', 4, 'mixer.jpg');

-- Insert Sample Admin User (password: admin123)
-- Note: In production, this should be hashed. The application will hash it automatically
INSERT INTO users (username, password, email, role, address) VALUES
('admin', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'admin@bakingshop.com', 'admin', '123 Admin Street');

-- Insert Sample Customer User (password: customer123)
INSERT INTO users (username, password, email, role, address) VALUES
('customer1', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'customer@example.com', 'customer', '456 Customer Avenue');
