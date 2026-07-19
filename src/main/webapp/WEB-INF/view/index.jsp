<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinefoodorder.model.Food" %>
<%@ page import="com.onlinefoodorder.utility.Helper" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FoodBite - Premium Food Delivery</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
    <%@ include file="./components/navbar.jsp"%>
    
    <!-- Hero Banner -->
    <div class="position-relative overflow-hidden mb-5 bg-primary text-white" style="border-radius: 0 0 40px 40px; margin-top: -20px; padding: 80px 0;">
        <div class="position-absolute top-0 start-0 w-100 h-100" style="background: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=2070') center/cover; opacity: 0.2; mix-blend-mode: overlay;"></div>
        <div class="container-fluid px-lg-5 position-relative z-index-1">
            <div class="row align-items-center">
                <div class="col-lg-6 text-center text-lg-start animate-slide-up">
                    <span class="badge bg-white text-primary rounded-pill px-3 py-2 mb-3 fw-bold shadow-sm">Fastest Delivery in Town</span>
                    <h1 class="display-3 fw-bold mb-4 text-white" style="line-height: 1.2;">Discover the best food<br>& drinks in your city</h1>
                    <p class="fs-5 text-light mb-5 opacity-75">Order from over 100+ premium restaurants and get it delivered in less than 30 minutes.</p>
                    <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center justify-content-lg-start">
                        <a href="#menu-section" class="btn btn-light btn-lg rounded-pill px-5 text-primary fw-bold shadow">Explore Menu</a>
                        <a href="#" class="btn btn-outline-light btn-lg rounded-pill px-5 fw-bold">View Offers</a>
                    </div>
                </div>
                <div class="col-lg-6 d-none d-lg-block animate-fade">
                    <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&q=80&w=800" alt="Delicious Burger" class="img-fluid rounded-circle shadow-lg border border-4 border-white" style="width: 450px; height: 450px; object-fit: cover; transform: rotate(10deg);">
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="./components/message.jsp"%>
    
    <%
        List<Food> foods = (List<Food>)request.getAttribute("foods");
        String foodsSentFromOtherSource = (String)request.getAttribute("sentFromOtherSource");
        List<Category> categories = categoryDao.findAll();  
        
        if(foodsSentFromOtherSource == null ){
            foods = foodDao.findAll();
        }
    %>
    
    <div class="container-fluid px-lg-5 mb-5">
        
        <!-- Quick Categories -->
        <div class="mb-5 animate-fade">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <h3 class="fw-bold m-0 text-dark">Explore by Category</h3>
                <a href="#" class="text-primary text-decoration-none fw-bold">View All <i class="fa-solid fa-arrow-right ms-1"></i></a>
            </div>
            <div class="row flex-nowrap overflow-auto pb-3 hide-scrollbar g-4">
                <div class="col-auto">
                    <a href="category?categoryId=0" class="text-decoration-none">
                        <div class="card border-0 shadow-sm rounded-4 text-center p-4 hover-shadow transition" style="width: 140px;">
                            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 60px; height: 60px; font-size: 1.5rem;">
                                <i class="fa-solid fa-utensils"></i>
                            </div>
                            <h6 class="fw-bold text-dark m-0">All</h6>
                        </div>
                    </a>
                </div>
                <% for(Category c: categories) { %>
                <div class="col-auto">
                    <a href="category?categoryId=<%=c.getId()%>" class="text-decoration-none">
                        <div class="card border-0 shadow-sm rounded-4 text-center p-4 hover-shadow transition" style="width: 140px;">
                            <div class="bg-light text-primary rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 60px; height: 60px; font-size: 1.5rem;">
                                <i class="fa-solid fa-pizza-slice"></i>
                            </div>
                            <h6 class="fw-bold text-dark m-0 text-truncate" title="<%=c.getName()%>"><%=c.getName()%></h6>
                        </div>
                    </a>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Special Offers Banner -->
        <div class="row mb-5 animate-slide-up">
            <div class="col-md-6 mb-4 mb-md-0">
                <div class="card border-0 rounded-4 overflow-hidden shadow-sm h-100 text-white" style="background: linear-gradient(135deg, var(--primary-color), var(--dark-primary));">
                    <div class="card-body p-5 position-relative">
                        <i class="fa-solid fa-tags position-absolute opacity-10" style="font-size: 10rem; right: -20px; bottom: -20px;"></i>
                        <span class="badge bg-white text-primary mb-3">Limited Time</span>
                        <h2 class="fw-bold mb-3">Get 50% OFF<br>on your first order!</h2>
                        <p class="opacity-75 mb-4">Use code <strong>WELCOME50</strong> at checkout.</p>
                        <button class="btn btn-light rounded-pill px-4 text-primary fw-bold">Order Now</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card border-0 rounded-4 overflow-hidden shadow-sm h-100 text-white" style="background: linear-gradient(135deg, #f59e0b, #d97706);">
                    <div class="card-body p-5 position-relative">
                        <i class="fa-solid fa-bolt position-absolute opacity-10" style="font-size: 10rem; right: -20px; bottom: -20px;"></i>
                        <span class="badge bg-white text-warning mb-3">Trending</span>
                        <h2 class="fw-bold mb-3">Free Delivery<br>on orders over &#8377;500</h2>
                        <p class="opacity-75 mb-4">Automatically applied at checkout.</p>
                        <button class="btn btn-light rounded-pill px-4 text-warning fw-bold">Explore Menu</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Menu Section -->
        <div id="menu-section" class="mb-5">
            <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                <h3 class="fw-bold m-0 text-dark">Popular Dishes</h3>
                <div class="dropdown">
                    <button class="btn btn-outline-primary rounded-pill px-4 dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        <i class="fa-solid fa-filter me-2"></i> Filter: Recommended
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 rounded-3">
                        <li><a class="dropdown-item py-2" href="#">Rating: High to Low</a></li>
                        <li><a class="dropdown-item py-2" href="#">Delivery Time</a></li>
                        <li><a class="dropdown-item py-2" href="#">Price: Low to High</a></li>
                    </ul>
                </div>
            </div>
            
            <% if(foods!=null && !foods.isEmpty()) { %>
            <div class="row g-4">
                <% for(Food p: foods) { %>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 animate-slide-up">
                    <div class="food-card">
                        <% if(p.getDiscount() > 0) { %>
                        <div class="badge-discount"><i class="fa-solid fa-percent me-1"></i> <%=p.getDiscount()%>% OFF</div>
                        <% } %>
                        <div class="veg-badge <%= p.getName().toLowerCase().contains("chicken") || p.getName().toLowerCase().contains("beef") || p.getName().toLowerCase().contains("meat") ? "non-veg" : "veg" %>">
                            <i class="fa-solid fa-circle"></i>
                        </div>
                        
                        <div class="card-img-wrapper">
                            <img src="resources/productpic/<%=p.getImagePath() %>" alt="<%=p.getName()%>" loading="lazy">
                        </div>
                        
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h3 class="card-title m-0 pe-2 text-truncate" title="<%=p.getName()%>"><%=p.getName()%></h3>
                            </div>
                            
                            <p class="restaurant-name text-truncate"><i class="fa-solid fa-shop me-1 text-primary"></i> FoodBite Express</p>
                            
                            <p class="text-muted small mb-3" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; min-height: 40px;"><%=Helper.get10Words(p.getDescription()) %></p>
                            
                            <div class="food-meta">
                                <span><i class="fa-solid fa-star"></i> 4.8</span>
                                <span><i class="fa-regular fa-clock text-primary"></i> 30 min</span>
                                <span><i class="fa-solid fa-motorcycle text-success"></i> Free</span>
                            </div>
                            
                            <div class="card-footer-custom">
                                <div>
                                    <span class="price">&#8377;<%=Helper.getFoodSellingPrice(p.getPrice(), p.getDiscount()) %></span>
                                    <% if(p.getDiscount() > 0) { %>
                                    <span class="original-price">&#8377;<%=p.getPrice()%></span>
                                    <% } %>
                                </div>
                                <a href="food?foodId=<%=p.getId()%>" class="btn btn-primary rounded-circle shadow-sm" style="width: 40px; height: 40px; padding: 0; display: flex; align-items: center; justify-content: center;">
                                    <i class="fa-solid fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } else { %>
            <div class="text-center py-5">
                <i class="fa-solid fa-plate-wheat fa-4x text-muted mb-3 opacity-50"></i>
                <h4 class="text-muted fw-bold">No dishes found!</h4>
                <p>Try exploring other categories or check back later.</p>
            </div>
            <% } %>
        </div>
        
        <!-- Top Rated Restaurants -->
        <div class="mb-5">
            <h3 class="fw-bold mb-4 text-dark">Top Rated Restaurants</h3>
            <div class="row g-4">
                <div class="col-md-4 animate-slide-up">
                    <div class="card border-0 rounded-4 shadow-sm overflow-hidden hover-shadow transition">
                        <img src="https://images.unsplash.com/photo-1552566626-52f8b828add9?auto=format&fit=crop&q=80&w=600" class="card-img-top" style="height: 150px; object-fit: cover;">
                        <div class="card-body position-relative">
                            <div class="bg-white rounded-circle shadow p-2 position-absolute" style="top: -30px; right: 20px;">
                                <img src="https://ui-avatars.com/api/?name=BK&background=2563EB&color=fff" width="40" height="40" class="rounded-circle">
                            </div>
                            <h5 class="fw-bold mb-1">Burger King</h5>
                            <p class="text-muted small mb-3">American, Fast Food</p>
                            <div class="d-flex align-items-center text-warning mb-0 fw-bold">
                                <i class="fa-solid fa-star me-1"></i> 4.5 <span class="text-muted fw-normal ms-2">(1.2k+ reviews)</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 animate-slide-up" style="animation-delay: 0.1s;">
                    <div class="card border-0 rounded-4 shadow-sm overflow-hidden hover-shadow transition">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&q=80&w=600" class="card-img-top" style="height: 150px; object-fit: cover;">
                        <div class="card-body position-relative">
                            <div class="bg-white rounded-circle shadow p-2 position-absolute" style="top: -30px; right: 20px;">
                                <img src="https://ui-avatars.com/api/?name=DP&background=EF4444&color=fff" width="40" height="40" class="rounded-circle">
                            </div>
                            <h5 class="fw-bold mb-1">Domino's Pizza</h5>
                            <p class="text-muted small mb-3">Italian, Pizza</p>
                            <div class="d-flex align-items-center text-warning mb-0 fw-bold">
                                <i class="fa-solid fa-star me-1"></i> 4.7 <span class="text-muted fw-normal ms-2">(3.4k+ reviews)</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 animate-slide-up" style="animation-delay: 0.2s;">
                    <div class="card border-0 rounded-4 shadow-sm overflow-hidden hover-shadow transition">
                        <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&q=80&w=600" class="card-img-top" style="height: 150px; object-fit: cover;">
                        <div class="card-body position-relative">
                            <div class="bg-white rounded-circle shadow p-2 position-absolute" style="top: -30px; right: 20px;">
                                <img src="https://ui-avatars.com/api/?name=SB&background=22C55E&color=fff" width="40" height="40" class="rounded-circle">
                            </div>
                            <h5 class="fw-bold mb-1">Starbucks</h5>
                            <p class="text-muted small mb-3">Coffee, Bakery</p>
                            <div class="d-flex align-items-center text-warning mb-0 fw-bold">
                                <i class="fa-solid fa-star me-1"></i> 4.9 <span class="text-muted fw-normal ms-2">(5.1k+ reviews)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <%@ include file="./components/footer.jsp"%>
    
    <style>
        .hide-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .hide-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
</body>
</html>