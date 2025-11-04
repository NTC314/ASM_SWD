import React, { useState, useEffect } from 'react';
import { Container, Card, Table, Badge } from 'react-bootstrap';
import API from '../api/axios';
import Loader from '../components/Loader';
import { toast } from 'react-toastify';

const Orders = () => {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchOrders();
  }, []);

  const fetchOrders = async () => {
    try {
      const { data } = await API.get('/orders/myorders');
      setOrders(data);
    } catch (error) {
      toast.error('Failed to fetch orders');
    } finally {
      setLoading(false);
    }
  };

  const getStatusBadge = (status) => {
    const variants = {
      Pending: 'warning',
      Shipping: 'info',
      Delivered: 'success'
    };
    return <Badge bg={variants[status]}>{status}</Badge>;
  };

  if (loading) return <Loader />;

  return (
    <Container className="py-4">
      <h2 className="mb-4">📦 My Orders</h2>

      {orders.length === 0 ? (
        <Card>
          <Card.Body className="text-center py-5">
            <p className="text-muted">No orders yet</p>
          </Card.Body>
        </Card>
      ) : (
        orders.map((order) => (
          <Card key={order.id} className="mb-3">
            <Card.Body>
              <div className="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <strong>Order #{order.id}</strong>
                  <div className="text-muted small">
                    {new Date(order.created_at).toLocaleDateString()} • {order.payment_method}
                  </div>
                </div>
                <div className="text-end">
                  {getStatusBadge(order.status)}
                  <div className="text-primary mt-1">
                    <strong>${parseFloat(order.total_price).toFixed(2)}</strong>
                  </div>
                </div>
              </div>

              <Table size="sm" className="mb-0">
                <thead>
                  <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  {order.items?.map((item) => (
                    <tr key={item.id}>
                      <td>{item.product?.name}</td>
                      <td>{item.quantity}</td>
                      <td>${parseFloat(item.price).toFixed(2)}</td>
                    </tr>
                  ))}
                </tbody>
              </Table>
            </Card.Body>
          </Card>
        ))
      )}
    </Container>
  );
};

export default Orders;
