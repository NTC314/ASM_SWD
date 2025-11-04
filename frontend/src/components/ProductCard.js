import React, { useContext } from 'react';
import { Card, Button } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { CartContext } from '../context/CartContext';
import { toast } from 'react-toastify';

const ProductCard = ({ product }) => {
  const { addToCart } = useContext(CartContext);

  const handleAddToCart = () => {
    addToCart(product, 1);
    toast.success(`${product.name} added to cart!`);
  };

  return (
    <Card className="h-100 shadow-sm">
      <Card.Img 
        variant="top" 
        src={`https://via.placeholder.com/300x200?text=${encodeURIComponent(product.name)}`}
        alt={product.name}
        style={{ height: '200px', objectFit: 'cover' }}
      />
      <Card.Body className="d-flex flex-column">
        <Card.Title>{product.name}</Card.Title>
        <Card.Text className="text-muted small">
          {product.brand} • {product.category?.name}
        </Card.Text>
        <Card.Text className="text-truncate">
          {product.description}
        </Card.Text>
        <div className="mt-auto">
          <h5 className="text-primary">${parseFloat(product.price).toFixed(2)}</h5>
          <div className="d-flex gap-2">
            <Button 
              as={Link} 
              to={`/product/${product.id}`} 
              variant="outline-primary" 
              size="sm"
              className="flex-grow-1"
            >
              View Details
            </Button>
            <Button 
              variant="primary" 
              size="sm"
              onClick={handleAddToCart}
            >
              Add to Cart
            </Button>
          </div>
        </div>
      </Card.Body>
    </Card>
  );
};

export default ProductCard;
