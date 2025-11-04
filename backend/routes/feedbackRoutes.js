const express = require('express');
const router = express.Router();
const {
  createFeedback,
  getProductFeedbacks,
  updateFeedback,
  deleteFeedback
} = require('../controllers/feedbackController');
const { protect } = require('../middleware/auth');

router.post('/', protect, createFeedback);

router.get('/product/:productId', getProductFeedbacks);

router.route('/:id')
  .put(protect, updateFeedback)
  .delete(protect, deleteFeedback);

module.exports = router;
