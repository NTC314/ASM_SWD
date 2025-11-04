import React, { useState, useContext } from 'react';
import { Container, Row, Col, Card, Form, Button } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import { CartContext } from '../context/CartContext';
import { AuthContext } from '../context/AuthContext';
import API from '../api/axios';
import { toast } from 'react-toastify';

const Checkout = () => {
  const { cartItems, getCartTotal, clearCart } = useContext(CartContext);
  const { user } = useContext(AuthContext);
  const navigate = useNavigate();
  
  const [paymentMethod, setPaymentMethod] = useState('COD');
  const [loading, setLoading] = useState(false);

  const handleSubmitOrder = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      const orderData = {
        items: cartItems.map(item => ({
          product_id: item.id,
          quantity: item.quantity
        })),
        payment_method: paymentMethod
      };

      const { data } = await API.post('/orders', orderData);
      toast.success('Order placed successfully!');
      clearCart();
      navigate(`/orders`);
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to place order');
    } finally {
      setLoading(false);
    }
  };

  if (cartItems.length === 0) {
    navigate('/cart');
    return null;
  }

  return (
    <Container className="py-4">
      <h2 className="mb-4">Checkout</h2>

      <Row>
        <Col lg={8}>
          <Card className="mb-4">
            <Card.Body>
              <h4>Shipping Address</h4>
              <p><strong>{user?.username}</strong></p>
              <p>{user?.email}</p>
              <p>{user?.address || 'No address provided'}</p>
            </Card.Body>
          </Card>

          <Card className="mb-4">
            <Card.Body>
              <h4>Order Items</h4>
              {cartItems.map((item) => (
                <div key={item.id} className="d-flex justify-content-between align-items-center mb-3">
                  <div className="d-flex align-items-center">
                    <img
                      src={`https://via.placeholder.com/60?text=${encodeURIComponent(item.name)}`}
                      alt={item.name}
                      className="me-3"
                      style={{ width: '60px', height: '45px' }}
                    />
                    <div>
                      <strong>{item.name}</strong>
                      <div className="text-muted small">Qty: {item.quantity}</div>
                    </div>
                  </div>
                  <span>${(parseFloat(item.price) * item.quantity).toFixed(2)}</span>
                </div>
              ))}
            </Card.Body>
          </Card>

          <Card>
            <Card.Body>
              <h4>Payment Method</h4>
              <Form onSubmit={handleSubmitOrder}>
                <Form.Group>
                  <Form.Check
                    type="radio"
                    label="💵 Cash on Delivery (COD)"
                    name="payment"
                    value="COD"
                    checked={paymentMethod === 'COD'}
                    onChange={(e) => setPaymentMethod(e.target.value)}
                  />
                  <Form.Check
                    type="radio"
                    label="💳 VNPay"
                    name="payment"
                    value="VNPay"
                    checked={paymentMethod === 'VNPay'}
                    onChange={(e) => setPaymentMethod(e.target.value)}
                  />
                  <Form.Check
                    type="radio"
                    label="📱 MoMo"
                    name="payment"
                    value="MoMo"
                    checked={paymentMethod === 'MoMo'}
                    onChange={(e) => setPaymentMethod(e.target.value)}
                  />
                </Form.Group>
              </Form>
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
                onClick={handleSubmitOrder}
                disabled={loading}
              >
                {loading ? 'Placing Order...' : 'Place Order'}
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default Checkout;
