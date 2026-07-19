<%@ page import ="com.onlinefoodorder.model.*"%>
<%@ page import="com.onlinefoodorder.utility.*"%>
<%@ page import="com.onlinefoodorder.dao.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

<%
String userType=(String)session.getAttribute("user-login");
Admin admin = null;
User user = null ;
DeliveryPerson deliveryPerson = null;
if(userType != null && userType.equals("admin")){
	 admin = (Admin) session.getAttribute("active-user");
}
else if(userType != null && userType.equals("user")){
	 user= (User)session.getAttribute("active-user");
}
else if(userType != null && userType.equals("delivery")){
	 deliveryPerson = (DeliveryPerson) session.getAttribute("active-user");
}

ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
CategoryDao categoryDao = context.getBean(CategoryDao.class);
CartDao cartDao = context.getBean(CartDao.class);
FoodDao foodDao = context.getBean(FoodDao.class);
UserDao userDao =context.getBean(UserDao.class);
OrderDao orderDao =context.getBean(OrderDao.class);

int cartCount = 0;
if(user != null) {
    List<Cart> cl = cartDao.findByUserId(user.getId());
    if(cl != null) cartCount = cl.size();
}
%>

<div class="app-wrapper">
    <!-- Premium Sidebar -->
    <aside class="app-sidebar" id="appSidebar">
        <a href="/" class="sidebar-brand">
            <i class="fa-solid fa-utensils"></i>
            <span>FoodBite</span>
        </a>
        
        <ul class="sidebar-menu">
            <li>
                <a href="/" class="active">
                    <i class="fa-solid fa-house"></i>
                    <span>Home</span>
                </a>
            </li>
            
            <% if(userType != null && userType.equals("admin")) { %>
            <li>
                <a href="admindashboard">
                    <i class="fa-solid fa-chart-pie"></i>
                    <span>Admin Dashboard</span>
                </a>
            </li>
            <% } %>
            
            <% if(userType != null && userType.equals("delivery")) { %>
            <li>
                <a href="deliverydashboard">
                    <i class="fa-solid fa-truck"></i>
                    <span>Delivery Tasks</span>
                </a>
            </li>
            <% } %>
            
            <li class="mt-4 mb-2 px-3 text-uppercase text-muted" style="font-size: 0.75rem; font-weight: 600; letter-spacing: 1px;">Menu</li>
            
            <li>
                <a href="category?categoryId=0">
                    <i class="fa-solid fa-burger"></i>
                    <span>All Categories</span>
                </a>
            </li>
            
            <% for(Category c: categoryDao.findAll()) { %>
            <li>
                <a href="category?categoryId=<%=c.getId()%>">
                    <i class="fa-solid fa-angle-right" style="font-size: 0.8rem;"></i>
                    <span><%=c.getName()%></span>
                </a>
            </li>
            <% } %>
            
            <li class="mt-4 mb-2 px-3 text-uppercase text-muted" style="font-size: 0.75rem; font-weight: 600; letter-spacing: 1px;">Company</li>
            
            <li>
                <a href="#" data-bs-toggle="modal" data-bs-target=".aboutusmodal">
                    <i class="fa-solid fa-circle-info"></i>
                    <span>About Us</span>
                </a>
            </li>
            <li>
                <a href="#" data-bs-toggle="modal" data-bs-target=".contactusmodal">
                    <i class="fa-solid fa-headset"></i>
                    <span>Contact</span>
                </a>
            </li>
        </ul>
    </aside>

    <!-- Main Content Area -->
    <div class="app-main">
        <!-- Top Navbar -->
        <nav class="app-navbar">
            <div class="d-flex align-items-center">
                <button class="btn btn-light d-lg-none me-3" type="button" onclick="document.getElementById('appSidebar').classList.toggle('show')">
                    <i class="fa-solid fa-bars"></i>
                </button>
                <form class="navbar-search d-none d-md-block" action="searchfood">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" name="foodname" placeholder="Search for food, restaurants...">
                </form>
            </div>
            
            <div class="navbar-actions">
                <a href="#" class="action-icon">
                    <i class="fa-regular fa-bell"></i>
                    <span class="badge-count" style="background: var(--warning-color);">3</span>
                </a>
                
                <% if(userType != null && userType.equals("user")) { %>
                <a href="#" class="action-icon" data-bs-toggle="modal" data-bs-target="#showmycartmodal">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <% if(cartCount > 0) { %>
                    <span class="badge-count"><%=cartCount%></span>
                    <% } %>
                </a>
                <a href="myorder" class="action-icon">
                    <i class="fa-solid fa-clipboard-list"></i>
                </a>
                <% } %>
                
                <% if(userType != null) { %>
                <div class="dropdown profile-dropdown ms-2">
                    <a href="#" class="dropdown-toggle d-flex align-items-center text-decoration-none" data-bs-toggle="dropdown">
                        <div class="d-flex flex-column text-end me-2 d-none d-sm-flex">
                            <span class="fw-bold text-dark" style="font-size: 0.9rem;">
                                <% if(userType.equals("admin") && admin != null) out.print(admin.getFirstname()); 
                                   else if(userType.equals("user") && user != null) out.print(user.getFirstname());
                                   else if(deliveryPerson != null) out.print(deliveryPerson.getFirstname()); %>
                            </span>
                            <span class="text-muted" style="font-size: 0.75rem; text-transform: capitalize;"><%=userType%></span>
                        </div>
                        <img src="https://ui-avatars.com/api/?name=User&background=2563EB&color=fff" alt="Profile">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-3" style="min-width: 200px;">
                        <li><a class="dropdown-item py-2" href="#"><i class="fa-regular fa-user me-2 text-muted"></i> My Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item py-2 text-danger" href="#" data-bs-toggle="modal" data-bs-target=".logout-modal"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a></li>
                    </ul>
                </div>
                <% } else { %>
                <div class="dropdown ms-2">
                    <a class="btn btn-primary rounded-pill px-4" href="#" data-bs-toggle="dropdown">
                        <i class="fa-regular fa-circle-user me-2"></i> Sign In
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end border-0 shadow mt-3" style="min-width: 250px;">
                        <li><h6 class="dropdown-header text-primary fw-bold">Customer</h6></li>
                        <li><a class="dropdown-item py-2" href="userlogin"><i class="fa-solid fa-arrow-right-to-bracket me-2 text-muted"></i> Login</a></li>
                        <li><a class="dropdown-item py-2" href="userregister"><i class="fa-solid fa-user-plus me-2 text-muted"></i> Register</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><h6 class="dropdown-header text-primary fw-bold">Delivery Partner</h6></li>
                        <li><a class="dropdown-item py-2" href="deliverylogin"><i class="fa-solid fa-motorcycle me-2 text-muted"></i> Login</a></li>
                        <li><a class="dropdown-item py-2" href="deliveryregister"><i class="fa-solid fa-user-plus me-2 text-muted"></i> Register</a></li>
                    </ul>
                </div>
                <% } %>
            </div>
        </nav>

<!-- show my cart modal -->
<div class="modal fade" id="showmycartmodal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg">
      <div class="modal-header bg-white text-dark border-bottom px-4 py-3">
        <h5 class="modal-title fw-bold" id="cartModalLabel"><i class="fa-solid fa-cart-shopping me-2 text-primary"></i> My Cart</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Cart> l= cartDao.findByUserId(user.getId());
     %>
      <div class="modal-body p-4">
        <% if(l.isEmpty()) { %>
        <div class="text-center py-5">
            <i class="fa-solid fa-cart-arrow-down fa-4x text-muted mb-3"></i>
            <h3 class="text-muted fw-bold">Your Cart is Empty</h3>
            <p>Looks like you haven't added anything yet.</p>
        </div>
        <% } else { %>
        <div class="table-responsive">
          <table class="table table-custom align-middle">
          <thead>
            <tr>
              <th scope="col">Item</th>
              <th scope="col">Title</th>    
              <th scope="col">Qty</th>
              <th scope="col">Price</th>
              <th scope="col">Date Added</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
           <%
               double totalCartPrice = 0;
              for(Cart c:l)
              {
            	  int foodId=c.getFoodId();
            	  Optional<Food> optional = foodDao.findById(foodId);
            	  Food f = optional.isPresent() ? optional.get() : null;
            	  if(f != null) {
            	  double foodPrice = Helper.getFoodSellingPrice(f.getPrice(), f.getDiscount());
            	  double cartPrice = foodPrice * c.getQuantity();
            	  totalCartPrice += cartPrice;
           %>
            <tr>
              <td>
                  <div class="bg-light rounded d-flex justify-content-center align-items-center overflow-hidden" style="width: 60px; height: 60px;">
                      <img src="resources/productpic/<%=f.getImagePath()%>" alt="food" style="width: 100%; height: 100%; object-fit: cover;">
                  </div>
              </td>
              <td>
                  <h6 class="mb-0 fw-bold"><%=f.getName() %></h6>
                  <small class="text-muted"><%=Helper.get10Words(f.getDescription()) %></small>
              </td>
              <td><span class="badge bg-primary px-3 py-2 rounded-pill"><%=c.getQuantity() %></span></td>
              <td><strong class="text-primary fs-5">&#8377;<%=Helper.getFoodSellingPrice(f.getPrice(), f.getDiscount()) %></strong></td>
              <td class="text-muted"><small><%=c.getDate() %></small></td>
              <td>
                  <a href="deletecart?cartId=<%=c.getId()%>" class="btn btn-sm btn-outline-danger rounded-circle" style="width: 35px; height: 35px; display: flex; align-items: center; justify-content: center;"><i class="fa-solid fa-trash"></i></a>
              </td>
            </tr>
            <% } } %>
          </tbody>
        </table>
        </div>
        
        <div class="bg-light rounded-4 p-4 mt-4 d-flex justify-content-between align-items-center shadow-sm">
             <div class="d-flex flex-column">
                 <span class="text-muted text-uppercase" style="font-size: 0.8rem; font-weight: 600;">Total Amount</span>
                 <h3 class="mb-0 text-primary fw-bold">&#8377;<%= totalCartPrice %></h3>
             </div>
             <div class="d-flex gap-3">
                 <button type="button" class="btn btn-outline-primary px-4" data-bs-dismiss="modal">Continue Shopping</button>
                 <form action="checkout" method="post" class="m-0">
                      <input type="hidden" name="amount" value="<%=totalCartPrice%>">
                     <button type="submit" class="btn btn-primary px-4 shadow"><i class="fa-solid fa-credit-card me-2"></i> Proceed to Checkout</button>
                 </form>
             </div>
        </div>
       <% } %>
      </div>
  <% } %>
    </div>
  </div>
</div>

<!-- Logout modal -->
<div class="modal fade logout-modal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg">
    <div class="modal-body text-center p-5">
            <div class="mb-4 text-danger">
                <i class="fa-solid fa-right-from-bracket fa-4x"></i>
            </div>
            <h4 class="mb-4 fw-bold">Ready to leave?</h4>
            <div class="d-grid gap-2">
              <a href="logout" class="btn btn-danger btn-lg rounded-pill shadow">Yes, Logout</a>
              <button type="button" class="btn btn-light rounded-pill" data-bs-dismiss="modal">Cancel</button>
            </div> 
     </div>     
    </div>
  </div>
</div>

<!-- About us modal -->
<div class="modal fade aboutusmodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg">
      <div class="modal-body p-5">
        <div class="text-center mb-5">
            <i class="fa-solid fa-utensils fa-4x text-primary mb-3"></i>
            <h2 class="fw-bold text-dark">FoodBite</h2>
        </div>
        <div class="row g-4">
            <div class="col-md-6">
                <h5 class="fw-bold text-primary mb-3"><i class="fa-solid fa-rocket me-2"></i> Our Mission</h5>
                <p class="text-muted lh-lg">We strive to provide you with the best culinary experience right at your doorstep. We partner with top restaurants and expert delivery personnel to ensure your food arrives hot, fresh, and on time.</p>
            </div>
            <div class="col-md-6">
                <h5 class="fw-bold text-primary mb-3"><i class="fa-solid fa-heart me-2"></i> Why Choose Us</h5>
                <ul class="text-muted lh-lg list-unstyled">
                    <li><i class="fa-solid fa-check text-success me-2"></i> Lightning fast delivery</li>
                    <li><i class="fa-solid fa-check text-success me-2"></i> Quality food from top chefs</li>
                    <li><i class="fa-solid fa-check text-success me-2"></i> 24/7 customer support</li>
                </ul>
            </div>
        </div>
        <button type="button" class="btn btn-outline-secondary w-100 mt-4 rounded-pill" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Contact us modal -->
<div class="modal fade contactusmodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg p-3">
      <div class="modal-body text-center p-4">
        <div class="bg-light rounded-circle d-inline-flex p-4 mb-4 text-primary">
            <i class="fa-solid fa-headset fa-3x"></i>
        </div>
        <h3 class="fw-bold mb-2">Get in Touch</h3>
        <p class="text-muted mb-4">Our support team is always ready to help you.</p>
        
        <div class="card bg-light border-0 rounded-4 p-3 mb-3 text-start hover-shadow transition">
            <div class="d-flex align-items-center">
                <div class="bg-white rounded-circle p-3 text-primary shadow-sm me-3"><i class="fa-solid fa-phone"></i></div>
                <div>
                    <h6 class="mb-1 fw-bold text-dark">Call Us</h6>
                    <p class="mb-0 text-muted">+91 98765 43210</p>
                </div>
            </div>
        </div>
        
        <div class="card bg-light border-0 rounded-4 p-3 mb-4 text-start hover-shadow transition">
            <div class="d-flex align-items-center">
                <div class="bg-white rounded-circle p-3 text-primary shadow-sm me-3"><i class="fa-solid fa-envelope"></i></div>
                <div>
                    <h6 class="mb-1 fw-bold text-dark">Email Us</h6>
                    <p class="mb-0 text-muted">support@foodbite.com</p>
                </div>
            </div>
        </div>
        
        <button type="button" class="btn btn-primary w-100 rounded-pill" data-bs-dismiss="modal">Close Window</button>
      </div>
    </div>
  </div>
</div>