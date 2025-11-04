-- ============================================
-- SEED DATA FOR BAKING SHOP DATABASE
-- ============================================
-- This file contains comprehensive test data for all tables
-- Run this after creating the database schema

USE baking_shop;

-- Clear existing data (optional - uncomment if needed)
-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE feedbacks;
-- TRUNCATE TABLE order_items;
-- TRUNCATE TABLE orders;
-- TRUNCATE TABLE products;
-- TRUNCATE TABLE categories;
-- TRUNCATE TABLE users;
-- SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- 1. USERS TABLE - Customers and Admin
-- ============================================
-- Password for all accounts: "password123" (hashed with bcrypt)
-- Note: These are pre-hashed passwords using bcrypt with salt rounds = 10

INSERT INTO users (username, password, email, role, address, created_at) VALUES
-- Admin accounts
('admin', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'admin@bakingshop.com', 'admin', '123 Admin Street, Business District, HCM City', NOW()),
('admin2', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'admin2@bakingshop.com', 'admin', '456 Management Ave, District 1, HCM City', NOW()),

-- Customer accounts
('customer1', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'customer1@example.com', 'customer', '789 Customer Road, District 2, HCM City', NOW()),
('customer2', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'customer2@example.com', 'customer', '321 Buyer Street, District 3, HCM City', NOW()),
('nguyenvana', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'nguyenvana@gmail.com', 'customer', '12 Nguyen Hue, District 1, HCM City', NOW()),
('tranthib', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'tranthib@gmail.com', 'customer', '34 Le Loi, District 3, HCM City', NOW()),
('phamvancuong', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'cuongpham@yahoo.com', 'customer', '56 Tran Hung Dao, District 5, HCM City', NOW()),
('lethimai', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'mailethi@outlook.com', 'customer', '78 Vo Van Tan, District 3, HCM City', NOW()),
('hoangminhquan', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'quanhoang@gmail.com', 'customer', '90 Pasteur, District 1, HCM City', NOW()),
('dothihang', '$2a$10$KGXvJWwF.QvYhJqXzPvz8OqY4rKvFXLXqLJz9GJ0v2dxP8H8Q8dJm', 'hangdo@gmail.com', 'customer', '45 Hai Ba Trung, District 1, HCM City', NOW());

-- ============================================
-- 2. CATEGORIES TABLE - Product Categories
-- ============================================
INSERT INTO categories (id, name) VALUES
(1, 'Flour & Grains'),
(2, 'Butter & Dairy'),
(3, 'Chocolate & Cocoa'),
(4, 'Baking Tools & Equipment'),
(5, 'Ovens & Appliances'),
(6, 'Decorating Supplies'),
(7, 'Flavoring & Extracts'),
(8, 'Nuts & Dried Fruits'),
(9, 'Baking Pans & Molds'),
(10, 'Sugar & Sweeteners');

-- ============================================
-- 3. PRODUCTS TABLE - Baking Products
-- ============================================
INSERT INTO products (name, description, price, brand, category_id, image) VALUES
-- Flour & Grains (Category 1)
('All-Purpose Flour 1kg', 'Premium quality all-purpose flour perfect for cakes, cookies, and pastries', 2.50, 'Meizan', 1, 'flour-allpurpose.jpg'),
('Cake Flour 500g', 'Fine texture cake flour for light and fluffy cakes', 3.00, 'Meizan', 1, 'flour-cake.jpg'),
('Bread Flour 1kg', 'High protein flour ideal for bread making', 2.80, 'King Arthur', 1, 'flour-bread.jpg'),
('Whole Wheat Flour 1kg', 'Nutritious whole grain flour', 3.20, 'Bob\'s Red Mill', 1, 'flour-wholewheat.jpg'),
('Almond Flour 500g', 'Gluten-free almond flour for healthy baking', 8.50, 'Nature\'s Choice', 1, 'flour-almond.jpg'),

-- Butter & Dairy (Category 2)
('Unsalted Butter 250g', 'Pure dairy butter perfect for all baking needs', 4.00, 'Anchor', 2, 'butter-unsalted.jpg'),
('Salted Butter 250g', 'Rich salted butter for enhanced flavor', 4.20, 'Anchor', 2, 'butter-salted.jpg'),
('Heavy Cream 500ml', 'Rich cream for whipping and baking', 3.50, 'Elle & Vire', 2, 'cream-heavy.jpg'),
('Cream Cheese 250g', 'Smooth cream cheese for frosting and cheesecakes', 4.80, 'Philadelphia', 2, 'cream-cheese.jpg'),
('Greek Yogurt 500g', 'Thick creamy yogurt for moist cakes', 3.80, 'Fage', 2, 'yogurt-greek.jpg'),

-- Chocolate & Cocoa (Category 3)
('Dark Chocolate Chips 500g', '70% cocoa dark chocolate chips', 5.20, 'Lindt', 3, 'choco-dark-chips.jpg'),
('Milk Chocolate Chips 500g', 'Creamy milk chocolate chips', 4.80, 'Lindt', 3, 'choco-milk-chips.jpg'),
('Cocoa Powder 250g', 'Premium unsweetened cocoa powder', 6.00, 'Valrhona', 3, 'cocoa-powder.jpg'),
('White Chocolate Bar 200g', 'Smooth white chocolate for melting', 4.50, 'Callebaut', 3, 'choco-white-bar.jpg'),
('Chocolate Chunks 400g', 'Large chocolate chunks for cookies', 5.80, 'Ghirardelli', 3, 'choco-chunks.jpg'),

-- Baking Tools & Equipment (Category 4)
('Mixing Bowl Set (3pcs)', 'Stainless steel bowls in 3 sizes', 12.50, 'KitchenPro', 4, 'bowl-set.jpg'),
('Silicone Spatula Set (5pcs)', 'Heat-resistant spatulas in various sizes', 8.00, 'OXO', 4, 'spatula-set.jpg'),
('Digital Kitchen Scale', 'Precise digital scale up to 5kg', 15.00, 'Etekcity', 4, 'scale-digital.jpg'),
('Whisk Set (3pcs)', 'Professional whisks for perfect mixing', 10.00, 'KitchenAid', 4, 'whisk-set.jpg'),
('Measuring Cups & Spoons Set', 'Complete measuring tools set', 9.00, 'Prepworks', 4, 'measuring-set.jpg'),
('Rolling Pin (Wooden)', 'Classic wooden rolling pin for dough', 7.50, 'Traditional', 4, 'rolling-pin.jpg'),
('Pastry Brush Set (3pcs)', 'Silicone brushes for glazing', 6.50, 'OXO', 4, 'pastry-brush.jpg'),

-- Ovens & Appliances (Category 5)
('Electric Oven 32L', 'Compact oven with temperature control', 80.00, 'Panasonic', 5, 'oven-32l.jpg'),
('Electric Oven 45L', 'Large capacity oven for professional baking', 120.00, 'Bosch', 5, 'oven-45l.jpg'),
('Stand Mixer 5L', 'Professional stand mixer with multiple attachments', 150.00, 'KitchenAid', 5, 'mixer-stand.jpg'),
('Hand Mixer', 'Powerful hand mixer with 5 speed settings', 35.00, 'Cuisinart', 5, 'mixer-hand.jpg'),
('Food Processor', 'Multi-function food processor for chopping and mixing', 85.00, 'Cuisinart', 5, 'food-processor.jpg'),

-- Decorating Supplies (Category 6)
('Piping Bags & Tips Set (24pcs)', 'Complete decorating kit with multiple tips', 12.00, 'Wilton', 6, 'piping-set.jpg'),
('Food Coloring Gel Set (12 colors)', 'Vibrant gel colors for icing and dough', 15.00, 'AmeriColor', 6, 'food-coloring.jpg'),
('Fondant Kit', 'Ready-to-use fondant with tools', 18.00, 'Satin Ice', 6, 'fondant-kit.jpg'),
('Edible Glitter Set', 'Sparkly decorative glitter (6 colors)', 8.50, 'CK Products', 6, 'edible-glitter.jpg'),
('Cake Turntable', 'Rotating stand for easy decorating', 16.00, 'Ateco', 6, 'cake-turntable.jpg'),

-- Flavoring & Extracts (Category 7)
('Vanilla Extract 100ml', 'Pure vanilla extract from Madagascar', 12.00, 'Nielsen-Massey', 7, 'vanilla-extract.jpg'),
('Almond Extract 60ml', 'Natural almond flavoring', 8.00, 'McCormick', 7, 'almond-extract.jpg'),
('Lemon Extract 60ml', 'Pure lemon extract', 7.50, 'McCormick', 7, 'lemon-extract.jpg'),
('Peppermint Extract 60ml', 'Strong peppermint flavor', 7.00, 'McCormick', 7, 'peppermint-extract.jpg'),
('Cinnamon Powder 100g', 'Ground cinnamon spice', 5.00, 'Simply Organic', 7, 'cinnamon-powder.jpg'),

-- Nuts & Dried Fruits (Category 8)
('Walnuts (Chopped) 500g', 'Premium chopped walnuts', 10.00, 'Diamond', 8, 'walnuts-chopped.jpg'),
('Almonds (Sliced) 400g', 'Sliced almonds for topping', 9.50, 'Blue Diamond', 8, 'almonds-sliced.jpg'),
('Raisins 500g', 'Sweet dried raisins', 6.00, 'Sun-Maid', 8, 'raisins.jpg'),
('Dried Cranberries 400g', 'Tart dried cranberries', 7.50, 'Ocean Spray', 8, 'cranberries-dried.jpg'),
('Pecans (Halves) 400g', 'Premium pecan halves', 12.00, 'Planters', 8, 'pecans-halves.jpg'),

-- Baking Pans & Molds (Category 9)
('Round Cake Pan Set (3pcs)', 'Non-stick round pans: 6", 8", 10"', 20.00, 'Wilton', 9, 'cake-pan-round.jpg'),
('Muffin Pan (12 cups)', 'Standard muffin/cupcake pan', 12.00, 'USA Pan', 9, 'muffin-pan.jpg'),
('Loaf Pan', 'Classic bread loaf pan', 8.50, 'Pyrex', 9, 'loaf-pan.jpg'),
('Cookie Sheet Set (2pcs)', 'Large non-stick cookie sheets', 18.00, 'Nordic Ware', 9, 'cookie-sheet.jpg'),
('Bundt Pan', 'Decorative bundt cake pan', 15.00, 'Nordic Ware', 9, 'bundt-pan.jpg'),
('Springform Pan 9"', 'Removable bottom pan for cheesecakes', 14.00, 'Fat Daddio\'s', 9, 'springform-pan.jpg'),

-- Sugar & Sweeteners (Category 10)
('Granulated Sugar 1kg', 'Pure white granulated sugar', 2.00, 'Domino', 10, 'sugar-granulated.jpg'),
('Brown Sugar 1kg', 'Soft brown sugar for baking', 2.50, 'Domino', 10, 'sugar-brown.jpg'),
('Powdered Sugar 500g', 'Fine powdered sugar for frosting', 2.80, 'C&H', 10, 'sugar-powdered.jpg'),
('Honey 500g', 'Pure natural honey', 8.00, 'Nature Nate\'s', 10, 'honey.jpg'),
('Maple Syrup 250ml', 'Pure maple syrup', 12.00, 'Log Cabin', 10, 'maple-syrup.jpg');

-- ============================================
-- 4. ORDERS TABLE - Sample Orders
-- ============================================
INSERT INTO orders (user_id, total_price, status, payment_method, created_at) VALUES
-- Delivered orders (completed)
(3, 45.50, 'Delivered', 'COD', DATE_SUB(NOW(), INTERVAL 15 DAY)),
(4, 89.80, 'Delivered', 'VNPay', DATE_SUB(NOW(), INTERVAL 12 DAY)),
(5, 156.00, 'Delivered', 'MoMo', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(6, 34.20, 'Delivered', 'COD', DATE_SUB(NOW(), INTERVAL 8 DAY)),

-- Shipping orders (in transit)
(7, 78.50, 'Shipping', 'VNPay', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(8, 123.00, 'Shipping', 'COD', DATE_SUB(NOW(), INTERVAL 2 DAY)),
(9, 67.30, 'Shipping', 'MoMo', DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Pending orders (new orders)
(10, 95.00, 'Pending', 'COD', NOW()),
(3, 145.60, 'Pending', 'VNPay', NOW()),
(5, 58.90, 'Pending', 'MoMo', NOW());

-- ============================================
-- 5. ORDER_ITEMS TABLE - Order Details
-- ============================================
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
-- Order 1 (customer1 - Delivered)
(1, 1, 2, 2.50),  -- All-Purpose Flour x2
(1, 6, 1, 4.00),  -- Unsalted Butter
(1, 11, 3, 5.20), -- Dark Chocolate Chips x3
(1, 26, 1, 12.00), -- Vanilla Extract
(1, 46, 1, 2.00),  -- Granulated Sugar

-- Order 2 (customer2 - Delivered)
(2, 2, 1, 3.00),   -- Cake Flour
(2, 9, 1, 4.80),   -- Cream Cheese
(2, 16, 2, 12.50), -- Mixing Bowl Set x2
(2, 33, 1, 18.00), -- Fondant Kit
(2, 41, 1, 20.00), -- Round Cake Pan Set
(2, 47, 1, 2.50),  -- Brown Sugar

-- Order 3 (nguyenvana - Delivered)
(3, 24, 1, 150.00), -- Stand Mixer
(3, 30, 1, 12.00),  -- Piping Bags Set

-- Order 4 (tranthib - Delivered)
(4, 5, 1, 8.50),    -- Almond Flour
(4, 8, 1, 3.50),    -- Heavy Cream
(4, 14, 1, 4.50),   -- White Chocolate
(4, 36, 1, 7.50),   -- Lemon Extract
(4, 48, 1, 2.80),   -- Powdered Sugar

-- Order 5 (phamvancuong - Shipping)
(5, 3, 2, 2.80),    -- Bread Flour x2
(5, 7, 2, 4.20),    -- Salted Butter x2
(5, 21, 1, 7.50),   -- Rolling Pin
(5, 36, 2, 7.50),   -- Walnuts x2
(5, 42, 1, 12.00),  -- Muffin Pan
(5, 46, 2, 2.00),   -- Granulated Sugar x2

-- Order 6 (lethimai - Shipping)
(6, 23, 1, 80.00),  -- Electric Oven 32L
(6, 17, 1, 8.00),   -- Silicone Spatula Set
(6, 19, 1, 10.00),  -- Whisk Set
(6, 31, 1, 15.00),  -- Food Coloring Set

-- Order 7 (hoangminhquan - Shipping)
(7, 11, 4, 5.20),   -- Dark Chocolate Chips x4
(7, 12, 3, 4.80),   -- Milk Chocolate Chips x3
(7, 13, 1, 6.00),   -- Cocoa Powder
(7, 26, 1, 12.00),  -- Vanilla Extract
(7, 47, 2, 2.50),   -- Brown Sugar x2

-- Order 8 (dothihang - Pending)
(8, 25, 1, 35.00),  -- Hand Mixer
(8, 18, 1, 15.00),  -- Digital Kitchen Scale
(8, 20, 1, 9.00),   -- Measuring Cups Set
(8, 43, 1, 8.50),   -- Loaf Pan
(8, 49, 1, 8.00),   -- Honey

-- Order 9 (customer1 - Pending)
(9, 24, 1, 150.00), -- Stand Mixer

-- Order 10 (nguyenvana - Pending)
(10, 41, 1, 20.00), -- Round Cake Pan Set
(10, 42, 1, 12.00), -- Muffin Pan
(10, 44, 1, 18.00), -- Cookie Sheet Set
(10, 45, 1, 15.00); -- Bundt Pan

-- ============================================
-- 6. FEEDBACKS TABLE - Product Reviews
-- ============================================
INSERT INTO feedbacks (user_id, product_id, rating, comment, created_at) VALUES
-- Reviews for popular products
(3, 1, 5, 'Excellent flour! Makes the fluffiest cakes. Will definitely buy again!', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(4, 1, 4, 'Good quality flour, though a bit pricey compared to local brands.', DATE_SUB(NOW(), INTERVAL 8 DAY)),
(5, 1, 5, 'Perfect for all my baking needs. Consistent quality every time.', DATE_SUB(NOW(), INTERVAL 5 DAY)),

(3, 11, 5, 'Best dark chocolate chips! Rich flavor, melts beautifully.', DATE_SUB(NOW(), INTERVAL 9 DAY)),
(6, 11, 5, 'Amazing quality chocolate. My cookies turned out perfect!', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(7, 11, 4, 'Great chocolate, but wish it came in a larger package.', DATE_SUB(NOW(), INTERVAL 3 DAY)),

(5, 24, 5, 'This stand mixer is a game changer! So powerful and versatile.', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(4, 24, 5, 'Worth every penny! Makes baking so much easier and faster.', DATE_SUB(NOW(), INTERVAL 4 DAY)),

(3, 6, 5, 'Premium quality butter. Makes the best croissants!', DATE_SUB(NOW(), INTERVAL 11 DAY)),
(6, 6, 4, 'Good butter, fresh and creamy. A bit expensive but worth it.', DATE_SUB(NOW(), INTERVAL 5 DAY)),

(4, 23, 4, 'Good oven for the price. Heats evenly and easy to use.', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(7, 23, 5, 'Perfect for home baking! Compact but spacious enough for most recipes.', DATE_SUB(NOW(), INTERVAL 2 DAY)),

(5, 26, 5, 'The best vanilla extract I\'ve ever used! Pure and aromatic.', DATE_SUB(NOW(), INTERVAL 8 DAY)),
(8, 26, 5, 'A little goes a long way. Amazing flavor in my cakes and cookies.', DATE_SUB(NOW(), INTERVAL 3 DAY)),

(6, 16, 5, 'Sturdy bowls that don\'t slip. Great set for any baker!', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(9, 16, 4, 'Good quality mixing bowls. Wish they had measurement marks inside.', DATE_SUB(NOW(), INTERVAL 2 DAY)),

(7, 2, 5, 'Makes the lightest, most tender cakes. Highly recommend!', DATE_SUB(NOW(), INTERVAL 4 DAY)),
(10, 2, 5, 'My chiffon cakes have never been better. Perfect flour!', DATE_SUB(NOW(), INTERVAL 1 DAY)),

(8, 30, 4, 'Comprehensive piping set with many tips. Great for beginners.', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(3, 30, 5, 'Professional quality! My cake decorations look amazing now.', NOW()),

(9, 41, 5, 'Non-stick coating works perfectly. Easy to clean!', DATE_SUB(NOW(), INTERVAL 2 DAY)),
(4, 41, 4, 'Good pans, but the 10" pan is slightly warped.', DATE_SUB(NOW(), INTERVAL 1 DAY)),

(10, 13, 5, 'Rich cocoa flavor! Perfect for brownies and chocolate cakes.', DATE_SUB(NOW(), INTERVAL 4 DAY)),
(5, 13, 5, 'Best cocoa powder on the market. Smooth and deeply chocolatey.', NOW()),

(6, 18, 5, 'Accurate and easy to read. Essential tool for precise baking!', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(7, 18, 4, 'Works well, but battery drains quickly.', DATE_SUB(NOW(), INTERVAL 2 DAY)),

(8, 9, 5, 'Creamy and perfect for cheesecake. No lumps at all!', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(9, 9, 4, 'Good cream cheese, though a bit softer than I expected.', DATE_SUB(NOW(), INTERVAL 1 DAY)),

(10, 25, 5, 'Powerful hand mixer with great speed control. Love it!', NOW()),

(3, 47, 5, 'Moist and flavorful brown sugar. Great for cookies!', DATE_SUB(NOW(), INTERVAL 3 DAY)),

(4, 12, 4, 'Sweet and creamy chocolate chips. Kids love them!', DATE_SUB(NOW(), INTERVAL 2 DAY)),

(5, 36, 5, 'Fresh walnuts with great crunch. Perfect for brownies.', DATE_SUB(NOW(), INTERVAL 4 DAY));

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these to verify data was inserted correctly:

-- SELECT 'Users:' as Table_Name, COUNT(*) as Total_Records FROM users
-- UNION ALL
-- SELECT 'Categories:', COUNT(*) FROM categories
-- UNION ALL
-- SELECT 'Products:', COUNT(*) FROM products
-- UNION ALL
-- SELECT 'Orders:', COUNT(*) FROM orders
-- UNION ALL
-- SELECT 'Order Items:', COUNT(*) FROM order_items
-- UNION ALL
-- SELECT 'Feedbacks:', COUNT(*) FROM feedbacks;

-- ============================================
-- SUMMARY
-- ============================================
-- Users: 10 accounts (2 admin, 8 customers)
-- Categories: 10 categories
-- Products: 50 products across all categories
-- Orders: 10 orders (4 Delivered, 3 Shipping, 3 Pending)
-- Order Items: 40+ items across orders
-- Feedbacks: 20+ product reviews

-- All passwords are: password123
-- Admin accounts: admin, admin2
-- Customer accounts: customer1, customer2, nguyenvana, tranthib, phamvancuong, lethimai, hoangminhquan, dothihang

-- ============================================
-- END OF SEED DATA
-- ============================================
