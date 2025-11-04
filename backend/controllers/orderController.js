const { Order, OrderItem, Product, User } = require('../models');
const { sequelize } = require('../config/database');

// @desc    Create new order
// @route   POST /api/orders
// @access  Private
exports.createOrder = async (req, res) => {
  const transaction = await sequelize.transaction();
  
  try {
    const { items, payment_method } = req.body;

    if (!items || items.length === 0) {
      await transaction.rollback();
      return res.status(400).json({ message: 'No order items' });
    }

    // Calculate total price
    let totalPrice = 0;
    const orderItems = [];

    for (const item of items) {
      const product = await Product.findByPk(item.product_id);
      if (!product) {
        await transaction.rollback();
        return res.status(404).json({ message: `Product ${item.product_id} not found` });
      }

      const itemPrice = parseFloat(product.price) * item.quantity;
      totalPrice += itemPrice;

      orderItems.push({
        product_id: item.product_id,
        quantity: item.quantity,
        price: product.price
      });
    }

    // Create order
    const order = await Order.create({
      user_id: req.user.id,
      total_price: totalPrice,
      payment_method,
      status: 'Pending'
    }, { transaction });

    // Create order items
    for (const item of orderItems) {
      await OrderItem.create({
        order_id: order.id,
        ...item
      }, { transaction });
    }

    await transaction.commit();

    // Fetch complete order with items
    const completeOrder = await Order.findByPk(order.id, {
      include: [
        {
          model: OrderItem,
          as: 'items',
          include: [{
            model: Product,
            as: 'product'
          }]
        }
      ]
    });

    res.status(201).json(completeOrder);
  } catch (error) {
    await transaction.rollback();
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get user orders
// @route   GET /api/orders/myorders
// @access  Private
exports.getMyOrders = async (req, res) => {
  try {
    const orders = await Order.findAll({
      where: { user_id: req.user.id },
      include: [
        {
          model: OrderItem,
          as: 'items',
          include: [{
            model: Product,
            as: 'product'
          }]
        }
      ],
      order: [['created_at', 'DESC']]
    });

    res.json(orders);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get order by ID
// @route   GET /api/orders/:id
// @access  Private
exports.getOrderById = async (req, res) => {
  try {
    const order = await Order.findByPk(req.params.id, {
      include: [
        {
          model: OrderItem,
          as: 'items',
          include: [{
            model: Product,
            as: 'product'
          }]
        },
        {
          model: User,
          as: 'user',
          attributes: ['id', 'username', 'email', 'address']
        }
      ]
    });

    if (!order) {
      return res.status(404).json({ message: 'Order not found' });
    }

    // Check if user owns this order or is admin
    if (order.user_id !== req.user.id && req.user.role !== 'admin') {
      return res.status(403).json({ message: 'Not authorized to view this order' });
    }

    res.json(order);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Update order status (Admin)
// @route   PUT /api/orders/:id/status
// @access  Private/Admin
exports.updateOrderStatus = async (req, res) => {
  try {
    const { status } = req.body;
    const order = await Order.findByPk(req.params.id);

    if (order) {
      order.status = status;
      const updatedOrder = await order.save();
      res.json(updatedOrder);
    } else {
      res.status(404).json({ message: 'Order not found' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get all orders (Admin)
// @route   GET /api/orders
// @access  Private/Admin
exports.getAllOrders = async (req, res) => {
  try {
    const orders = await Order.findAll({
      include: [
        {
          model: OrderItem,
          as: 'items',
          include: [{
            model: Product,
            as: 'product'
          }]
        },
        {
          model: User,
          as: 'user',
          attributes: ['id', 'username', 'email']
        }
      ],
      order: [['created_at', 'DESC']]
    });

    res.json(orders);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
