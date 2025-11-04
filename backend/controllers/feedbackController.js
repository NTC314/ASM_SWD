const { Feedback, User, Product } = require('../models');

// @desc    Create product feedback
// @route   POST /api/feedbacks
// @access  Private
exports.createFeedback = async (req, res) => {
  try {
    const { product_id, rating, comment } = req.body;

    // Check if product exists
    const product = await Product.findByPk(product_id);
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }

    // Check if user already reviewed this product
    const existingFeedback = await Feedback.findOne({
      where: {
        user_id: req.user.id,
        product_id
      }
    });

    if (existingFeedback) {
      return res.status(400).json({ message: 'You have already reviewed this product' });
    }

    // Create feedback
    const feedback = await Feedback.create({
      user_id: req.user.id,
      product_id,
      rating,
      comment
    });

    const completeFeedback = await Feedback.findByPk(feedback.id, {
      include: [{
        model: User,
        as: 'user',
        attributes: ['id', 'username']
      }]
    });

    res.status(201).json(completeFeedback);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get feedbacks for a product
// @route   GET /api/feedbacks/product/:productId
// @access  Public
exports.getProductFeedbacks = async (req, res) => {
  try {
    const feedbacks = await Feedback.findAll({
      where: { product_id: req.params.productId },
      include: [{
        model: User,
        as: 'user',
        attributes: ['id', 'username']
      }],
      order: [['created_at', 'DESC']]
    });

    res.json(feedbacks);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Update feedback
// @route   PUT /api/feedbacks/:id
// @access  Private
exports.updateFeedback = async (req, res) => {
  try {
    const feedback = await Feedback.findByPk(req.params.id);

    if (!feedback) {
      return res.status(404).json({ message: 'Feedback not found' });
    }

    // Check if user owns this feedback
    if (feedback.user_id !== req.user.id) {
      return res.status(403).json({ message: 'Not authorized to update this feedback' });
    }

    feedback.rating = req.body.rating || feedback.rating;
    feedback.comment = req.body.comment || feedback.comment;

    const updatedFeedback = await feedback.save();
    res.json(updatedFeedback);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Delete feedback
// @route   DELETE /api/feedbacks/:id
// @access  Private
exports.deleteFeedback = async (req, res) => {
  try {
    const feedback = await Feedback.findByPk(req.params.id);

    if (!feedback) {
      return res.status(404).json({ message: 'Feedback not found' });
    }

    // Check if user owns this feedback or is admin
    if (feedback.user_id !== req.user.id && req.user.role !== 'admin') {
      return res.status(403).json({ message: 'Not authorized to delete this feedback' });
    }

    await feedback.destroy();
    res.json({ message: 'Feedback removed' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
