import { useState } from 'react';
import { 
  LayoutDashboard, 
  ReceiptText, 
  UtensilsCrossed, 
  Wallet, 
  Settings,
  Search,
  Plus,
  Minus
} from 'lucide-react';
import './App.css';

const MENU_ITEMS = [
  { id: 1, name: 'Spicy Beef Burger', category: 'Burger', price: 8.99, image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 2, name: 'Classic Cheese Pizza', category: 'Pizza', price: 12.50, image: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 3, name: 'Chicken Salad', category: 'Salad', price: 7.50, image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 4, name: 'Asian Noodles', category: 'Noodles', price: 9.99, image: 'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 5, name: 'Double Veggie Burger', category: 'Burger', price: 7.99, image: 'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 6, name: 'Pepperoni Pizza', category: 'Pizza', price: 14.50, image: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 7, name: 'Fruit Salad', category: 'Salad', price: 6.50, image: 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&q=80&w=300&h=300' },
  { id: 8, name: 'Spicy Ramen', category: 'Noodles', price: 10.99, image: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&q=80&w=300&h=300' },
];

const CATEGORIES = ['All', 'Burger', 'Pizza', 'Salad', 'Noodles'];

function App() {
  const [activeCategory, setActiveCategory] = useState('All');
  const [cart, setCart] = useState([
    { ...MENU_ITEMS[0], quantity: 2 },
    { ...MENU_ITEMS[3], quantity: 1 }
  ]);
  const [orderType, setOrderType] = useState('Dine In');

  const filteredMenu = activeCategory === 'All' 
    ? MENU_ITEMS 
    : MENU_ITEMS.filter(item => item.category === activeCategory);

  const subtotal = cart.reduce((acc, item) => acc + (item.price * item.quantity), 0);
  const tax = subtotal * 0.05; // 5% tax
  const total = subtotal + tax;

  const addToCart = (item) => {
    const existing = cart.find(c => c.id === item.id);
    if (existing) {
      setCart(cart.map(c => c.id === item.id ? { ...c, quantity: c.quantity + 1 } : c));
    } else {
      setCart([...cart, { ...item, quantity: 1 }]);
    }
  };

  const updateQuantity = (id, delta) => {
    setCart(cart.map(c => {
      if (c.id === id) {
        const newQ = c.quantity + delta;
        return newQ > 0 ? { ...c, quantity: newQ } : c;
      }
      return c;
    }).filter(c => c.quantity > 0));
  };

  return (
    <div className="dashboard-layout">
      {/* Sidebar */}
      <aside className="sidebar">
        <div className="logo-container">
          <div className="logo-icon">
            <UtensilsCrossed size={24} />
          </div>
          <h2>FoodPOS</h2>
        </div>
        <nav>
          <button className="nav-item active">
            <LayoutDashboard size={22} />
            <span>Dashboard</span>
          </button>
          <button className="nav-item">
            <ReceiptText size={22} />
            <span>Orders</span>
          </button>
          <button className="nav-item">
            <Wallet size={22} />
            <span>Wallet</span>
          </button>
          <button className="nav-item">
            <Settings size={22} />
            <span>Settings</span>
          </button>
        </nav>
      </aside>

      {/* Main Content */}
      <main className="main-content">
        <header className="header animate-fade-in">
          <div className="header-title">
            <h1>Choose Category</h1>
            <p>Welcome back, here is your menu for today!</p>
          </div>
          <div className="search-bar">
            <Search size={20} color="var(--text-light)" />
            <input type="text" placeholder="Search for food..." />
          </div>
        </header>

        <section className="categories animate-fade-in">
          {CATEGORIES.map(cat => (
            <button 
              key={cat}
              className={`category-btn ${activeCategory === cat ? 'active' : ''}`}
              onClick={() => setActiveCategory(cat)}
            >
              {cat}
            </button>
          ))}
        </section>

        <section className="menu-grid">
          {filteredMenu.map((item, index) => (
            <div 
              key={item.id} 
              className="menu-card animate-slide-up"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <img src={item.image} alt={item.name} className="menu-image" />
              <div className="menu-info">
                <h3>{item.name}</h3>
                <p>{item.category}</p>
              </div>
              <div className="menu-bottom">
                <span className="price">${item.price.toFixed(2)}</span>
                <button className="add-btn" onClick={() => addToCart(item)}>
                  <Plus size={20} />
                </button>
              </div>
            </div>
          ))}
        </section>
      </main>

      {/* Order Summary Panel */}
      <aside className="order-panel">
        <div className="order-header">
          <h2>Current Order</h2>
          <div className="order-types">
            <button 
              className={`type-btn ${orderType === 'Dine In' ? 'active' : ''}`}
              onClick={() => setOrderType('Dine In')}
            >Dine In</button>
            <button 
              className={`type-btn ${orderType === 'Take Away' ? 'active' : ''}`}
              onClick={() => setOrderType('Take Away')}
            >Take Away</button>
            <button 
              className={`type-btn ${orderType === 'Delivery' ? 'active' : ''}`}
              onClick={() => setOrderType('Delivery')}
            >Delivery</button>
          </div>
        </div>

        <div className="order-items">
          {cart.map(item => (
            <div key={item.id} className="order-item">
              <img src={item.image} alt={item.name} className="item-img" />
              <div className="item-details">
                <h4>{item.name}</h4>
                <div className="item-price">${item.price.toFixed(2)}</div>
              </div>
              <div className="item-actions">
                <div className="item-total">${(item.price * item.quantity).toFixed(2)}</div>
                <div className="qty-control">
                  <button className="qty-btn" onClick={() => updateQuantity(item.id, -1)}><Minus size={14}/></button>
                  <span className="qty-value">{item.quantity}</span>
                  <button className="qty-btn" onClick={() => updateQuantity(item.id, 1)}><Plus size={14}/></button>
                </div>
              </div>
            </div>
          ))}
        </div>

        <div className="order-summary">
          <div className="summary-row">
            <span>Subtotal</span>
            <span>${subtotal.toFixed(2)}</span>
          </div>
          <div className="summary-row">
            <span>Tax (5%)</span>
            <span>${tax.toFixed(2)}</span>
          </div>
          <div className="summary-row total">
            <span>Total</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <button className="checkout-btn" onClick={() => {
            if (cart.length === 0) {
              alert("Your cart is empty!");
              return;
            }
            const options = {
              "key": "rzp_test_dummykey",
              "amount": Math.round(total * 100),
              "currency": "USD",
              "name": "FoodPOS",
              "description": "Dummy Transaction",
              "handler": function (response){
                alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                setCart([]);
              },
              "prefill": {
                "name": "Test User",
                "email": "test@example.com",
                "contact": "9999999999"
              },
              "theme": {
                "color": "#f97316"
              }
            };
            
            if (window.Razorpay) {
                const rzp1 = new window.Razorpay(options);
                rzp1.on('payment.failed', function (response){
                  alert("Payment failed: " + response.error.description);
                });
                rzp1.open();
            } else {
                // Simulate Razorpay since it's a dummy transaction
                const response = {
                    razorpay_payment_id: "pay_dummy_" + Math.random().toString(36).substring(2, 10)
                };
                setTimeout(() => {
                    if (window.confirm(`DUMMY RAZORPAY MODAL\nAmount: ${total.toFixed(2)} USD\nClick OK to simulate successful payment.`)) {
                        options.handler(response);
                    } else {
                        alert("Payment failed: User cancelled dummy payment");
                    }
                }, 300);
            }
          }}>
            Checkout Order
          </button>
        </div>
      </aside>
    </div>
  );
}

export default App;
