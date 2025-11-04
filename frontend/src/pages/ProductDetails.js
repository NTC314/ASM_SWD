import React, { useState, useEffect, useContext } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Container, Row, Col, Button, Form, Card, ListGroup, Badge } from 'react-bootstrap';
import API from '../api/axios';
import Loader from '../components/Loader';
import { CartContext } from '../context/CartContext';
import { AuthContext } from '../context/AuthContext';
import { toast } from 'react-toastify';

const ProductDetails = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const { addToCart } = useContext(CartContext);
  const { user } = useContext(AuthContext);
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [quantity, setQuantity] = useState(1);
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');

  useEffect(() => {
    fetchProduct();
  }, [id]);

  const fetchProduct = async () => {
    try {
      const { data } = await API.get(`/products/${id}`);
      setProduct(data);
    } catch (error) {
      toast.error('Failed to fetch product');
    } finally {
      setLoading(false);
    }
  };

  const handleAddToCart = () => {
    addToCart(product, quantity);
    toast.success(`${product.name} added to cart!`);
  };

  const handleSubmitReview = async (e) => {
    e.preventDefault();
    if (!user) {
      toast.error('Please login to submit a review');
      navigate('/login');
      return;
    }

    try {
      await API.post('/feedbacks', {
        product_id: product.id,
        rating,
        comment
      });
      toast.success('Review submitted successfully!');
      setComment('');
      setRating(5);
      fetchProduct();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to submit review');
    }
  };

  if (loading) return <Loader />;
  if (!product) return <Container><p>Product not found</p></Container>;

  const avgRating = product.feedbacks?.length > 0
    ? (product.feedbacks.reduce((sum, f) => sum + f.rating, 0) / product.feedbacks.length).toFixed(1)
    : 'No ratings yet';

  return (
    <Container className="py-4">
      <Button variant="outline-secondary" onClick={() => navigate(-1)} className="mb-3">
        ← Back
      </Button>

      <Row>
        <Col md={6}>
          <img
            src={`https://via.placeholder.com/500x400?text=${encodeURIComponent(product.name)}`}
            alt={product.name}
            className="img-fluid rounded"
          />
        </Col>
        <Col md={6}>
          <h2>{product.name}</h2>
          <p className="text-muted">
            <strong>Brand:</strong> {product.brand} | <strong>Category:</strong> {product.category?.name}
          </p>
          <h3 className="text-primary">${parseFloat(product.price).toFixed(2)}</h3>
          <p>{product.description}</p>
          
          <div className="mb-3">
            <strong>Rating:</strong> ⭐ {avgRating} ({product.feedbacks?.length || 0} reviews)
          </div>

          <Form.Group className="mb-3">
            <Form.Label>Quantity</Form.Label>
            <Form.Control
              type="number"
              min="1"
              value={quantity}
              onChange={(e) => setQuantity(parseInt(e.target.value))}
              style={{ maxWidth: '100px' }}
            />
          </Form.Group>

          <Button variant="primary" size="lg" onClick={handleAddToCart}>
            🛒 Add to Cart
          </Button>
        </Col>
      </Row>

      <Row className="mt-5">
        <Col>
          <h4>Customer Reviews</h4>
          
          {user && (
            <Card className="mb-4">
              <Card.Body>
                <h5>Write a Review</h5>
                <Form onSubmit={handleSubmitReview}>
                  <Form.Group className="mb-3">
                    <Form.Label>Rating</Form.Label>
                    <Form.Select value={rating} onChange={(e) => setRating(e.target.value)}>
                      <option value="5">5 - Excellent</option>
                      <option value="4">4 - Good</option>
                      <option value="3">3 - Average</option>
                      <option value="2">2 - Poor</option>
                      <option value="1">1 - Terrible</option>
                    </Form.Select>
                  </Form.Group>
                  <Form.Group className="mb-3">
                    <Form.Label>Comment</Form.Label>
                    <Form.Control
                      as="textarea"
                      rows={3}
                      value={comment}
                      onChange={(e) => setComment(e.target.value)}
                      required
                    />
                  </Form.Group>
                  <Button type="submit" variant="primary">Submit Review</Button>
                </Form>
              </Card.Body>
            </Card>
          )}

          <ListGroup>
            {product.feedbacks && product.feedbacks.length > 0 ? (
              product.feedbacks.map((feedback) => (
                <ListGroup.Item key={feedback.id}>
                  <div className="d-flex justify-content-between align-items-start">
                    <div>
                      <strong>{feedback.user?.username}</strong>
                      <div>
                        {'⭐'.repeat(feedback.rating)}
                        <Badge bg="secondary" className="ms-2">{feedback.rating}/5</Badge>
                      </div>
                      <p className="mb-0 mt-2">{feedback.comment}</p>
                    </div>
                    <small className="text-muted">
                      {new Date(feedback.created_at).toLocaleDateString()}
                    </small>
                  </div>
                </ListGroup.Item>
              ))
            ) : (
              <p className="text-muted">No reviews yet. Be the first to review!</p>
            )}
          </ListGroup>
        </Col>
      </Row>
    </Container>
  );
};

export default ProductDetails;
