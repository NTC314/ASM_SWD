const express = require('express');
const router = express.Router();
const {
  register,
  login,
  getProfile,
<<<<<<< HEAD
  updateProfile
} = require('../controllers/authController');
const { protect } = require('../middleware/auth');
=======
  updateProfile,
  getAllUsers,
  updateUser,
  deleteUser
} = require('../controllers/authController');
const { protect, admin } = require('../middleware/auth');
>>>>>>> main

router.post('/register', register);
router.post('/login', login);
router.route('/profile')
  .get(protect, getProfile)
  .put(protect, updateProfile);

<<<<<<< HEAD
=======
// Admin routes
router.get('/users', protect, admin, getAllUsers);
router.route('/users/:id')
  .put(protect, admin, updateUser)
  .delete(protect, admin, deleteUser);

>>>>>>> main
module.exports = router;
