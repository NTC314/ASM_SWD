const User = require('./User');
const Category = require('./Category');
const Product = require('./Product');
const Order = require('./Order');
const OrderItem = require('./OrderItem');
const Feedback = require('./Feedback');

// Define associations

// Category <-> Product
Category.hasMany(Product, { foreignKey: 'category_id', as: 'products' });
Product.belongsTo(Category, { foreignKey: 'category_id', as: 'category' });

// User <-> Order
User.hasMany(Order, { foreignKey: 'user_id', as: 'orders' });
Order.belongsTo(User, { foreignKey: 'user_id', as: 'user' });

// Order <-> OrderItem
Order.hasMany(OrderItem, { foreignKey: 'order_id', as: 'items' });
OrderItem.belongsTo(Order, { foreignKey: 'order_id', as: 'order' });

// Product <-> OrderItem
Product.hasMany(OrderItem, { foreignKey: 'product_id', as: 'orderItems' });
OrderItem.belongsTo(Product, { foreignKey: 'product_id', as: 'product' });

// User <-> Feedback
User.hasMany(Feedback, { foreignKey: 'user_id', as: 'feedbacks' });
Feedback.belongsTo(User, { foreignKey: 'user_id', as: 'user' });

// Product <-> Feedback
Product.hasMany(Feedback, { foreignKey: 'product_id', as: 'feedbacks' });
Feedback.belongsTo(Product, { foreignKey: 'product_id', as: 'product' });

module.exports = {
  User,
  Category,
  Product,
  Order,
  OrderItem,
  Feedback
};
