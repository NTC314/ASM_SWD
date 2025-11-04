import React, { useContext } from 'react';
import { Container, Row, Col, Card, Button, Table, Form } from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom';
import { CartContext } from '../context/CartContext';
import { AuthContext } from '../context/AuthContext';

const Cart = () => {
  const { cartItems, removeFromCart, updateQuantity, getCartTotal, clearCart } = useContext(CartContext);
  const { user } = useContext(AuthContext);
  const navigate = useNavigate();

  const handleCheckout = () => {
    if (!user) {
      navigate('/login');
      return;
    }
    navigate('/checkout');
  };

  if (cartItems.length === 0) {
    return (
      <Container className="py-5 text-center">
        <h2>🛒 Your Cart is Empty</h2>
        <p className="text-muted">Add some delicious baking ingredients to get started!</p>
        <Button as={Link} to="/" variant="primary">
          Continue Shopping
        </Button>
      </Container>
    );
  }

  return (
    <Container className="py-4">
      <h2 className="mb-4">🛒 Shopping Cart</h2>
      
      <Row>
        <Col lg={8}>
          <Card>
            <Card.Body>
              <Table responsive>
                <thead>
                  <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {cartItems.map((item) => (
                    <tr key={item.id}>
                      <td>
                        <div className="d-flex align-items-center">
                          <img
                            src={`https://via.placeholder.com/80?text=${encodeURIComponent(item.name)}`}
                            alt={item.name}
                            className="me-3"
                            style={{ width: '80px', height: '60px', objectFit: 'cover' }}
                          />
                          <div>
                            <strong>{item.name}</strong>
                            <div className="text-muted small">{item.brand}</div>
                          </div>
                        </div>
                      </td>
                      <td>${parseFloat(item.price).toFixed(2)}</td>
                      <td>
                        <Form.Control
                          type="number"
                          min="1"
                          value={item.quantity}
                          onChange={(e) => updateQuantity(item.id, parseInt(e.target.value))}
                          style={{ width: '80px' }}
                        />
                      </td>
                      <td>
                        <strong>${(parseFloat(item.price) * item.quantity).toFixed(2)}</strong>
                      </td>
                      <td>
                        <Button
                          variant="danger"
                          size="sm"
                          onClick={() => removeFromCart(item.id)}
                        >
                          ✕
                        </Button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </Table>
              <div className="text-end">
                <Button variant="outline-danger" onClick={clearCart}>
                  Clear Cart
                </Button>
              </div>
            </Card.Body>
          </Card>
        </Col>

        <Col lg={4}>
          <Card>
            <Card.Body>
              <h4>Order Summary</h4>
              <hr />
              <div className="d-flex justify-content-between mb-2">
                <span>Subtotal:</span>
                <strong>${getCartTotal().toFixed(2)}</strong>
              </div>
              <div className="d-flex justify-content-between mb-2">
                <span>Shipping:</span>
                <span className="text-success">FREE</span>
              </div>
              <hr />
              <div className="d-flex justify-content-between mb-3">
                <h5>Total:</h5>
                <h5 className="text-primary">${getCartTotal().toFixed(2)}</h5>
              </div>
              <Button
                variant="primary"
                size="lg"
                className="w-100"
                onClick={handleCheckout}
              >
                Proceed to Checkout
              </Button>
              <Button
                as={Link}
                to="/"
                variant="outline-secondary"
                className="w-100 mt-2"
              >
                Continue Shopping
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default Cart;
