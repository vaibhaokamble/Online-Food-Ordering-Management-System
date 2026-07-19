<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - FoodBite</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body class="bg-light">
    <%@ include file="./components/navbar.jsp"%>

    <%
    List<Category> li = new ArrayList<>();
    li = categoryDao.findAll();
    List<User> listOfAllUsers = new ArrayList<>();
    listOfAllUsers = userDao.findAll();
    %>

    <div class="container-fluid px-4 px-lg-5 py-4 animate-fade">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Admin Overview</h2>
                <p class="text-muted mb-0">Manage your business operations from a single place.</p>
            </div>
            <div class="d-flex gap-2">
                <button class="btn btn-primary shadow-sm" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                    <i class="fa-solid fa-folder-plus me-2"></i>New Category
                </button>
                <button class="btn btn-dark shadow-sm" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                    <i class="fa-solid fa-plus me-2"></i>New Food
                </button>
            </div>
        </div>

        <%@ include file="./components/message.jsp"%>

        <!-- Stats Row -->
        <div class="row g-4 mb-5">
            <!-- Customers Card -->
            <div class="col-xl-3 col-md-6 animate-slide-up" style="animation-delay: 0s;">
                <div class="metric-card cursor-pointer position-relative overflow-hidden" data-bs-toggle="modal" data-bs-target="#show-users-modal">
                    <div class="metric-icon bg-primary text-white bg-opacity-10" style="color: var(--primary-color) !important;">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div class="metric-info z-index-1">
                        <h4>Customers</h4>
                        <h2><%=userDao.count()%></h2>
                    </div>
                    <div class="position-absolute opacity-10" style="bottom: -20px; right: -10px; font-size: 6rem; color: var(--primary-color);">
                        <i class="fa-solid fa-users"></i>
                    </div>
                </div>
            </div>

            <!-- Categories Card -->
            <div class="col-xl-3 col-md-6 animate-slide-up" style="animation-delay: 0.1s;">
                <div class="metric-card cursor-pointer position-relative overflow-hidden" data-bs-toggle="modal" data-bs-target="#show-category-modal">
                    <div class="metric-icon bg-success text-white bg-opacity-10" style="color: var(--success-color) !important;">
                        <i class="fa-solid fa-list"></i>
                    </div>
                    <div class="metric-info z-index-1">
                        <h4>Categories</h4>
                        <h2><%=categoryDao.count()%></h2>
                    </div>
                    <div class="position-absolute opacity-10" style="bottom: -20px; right: -10px; font-size: 6rem; color: var(--success-color);">
                        <i class="fa-solid fa-list"></i>
                    </div>
                </div>
            </div>

            <!-- Foods Card -->
            <div class="col-xl-3 col-md-6 animate-slide-up" style="animation-delay: 0.2s;">
                <div class="metric-card cursor-pointer position-relative overflow-hidden" data-bs-toggle="modal" data-bs-target="#show-product-modal">
                    <div class="metric-icon bg-warning text-dark bg-opacity-10" style="color: var(--warning-color) !important;">
                        <i class="fa-solid fa-burger"></i>
                    </div>
                    <div class="metric-info z-index-1">
                        <h4>Menu Items</h4>
                        <h2><%=foodDao.count()%></h2>
                    </div>
                    <div class="position-absolute opacity-10" style="bottom: -20px; right: -10px; font-size: 6rem; color: var(--warning-color);">
                        <i class="fa-solid fa-burger"></i>
                    </div>
                </div>
            </div>

            <!-- Orders Card -->
            <div class="col-xl-3 col-md-6 animate-slide-up" style="animation-delay: 0.3s;">
                <div class="metric-card cursor-pointer position-relative overflow-hidden" data-bs-toggle="modal" data-bs-target="#total-order-modal">
                    <div class="metric-icon bg-danger text-white bg-opacity-10" style="color: var(--danger-color) !important;">
                        <i class="fa-solid fa-clipboard-list"></i>
                    </div>
                    <div class="metric-info z-index-1">
                        <h4>Total Orders</h4>
                        <h2><%=orderDao.count()%></h2>
                    </div>
                    <div class="position-absolute opacity-10" style="bottom: -20px; right: -10px; font-size: 6rem; color: var(--danger-color);">
                        <i class="fa-solid fa-clipboard-list"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Access Tables -->
        <div class="row g-4 mb-4">
            <div class="col-lg-6 animate-slide-up">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <div class="card-header bg-white border-bottom p-4 d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 text-dark"><i class="fa-solid fa-clock-rotate-left me-2 text-primary"></i> Recent Orders</h5>
                        <button class="btn btn-sm btn-outline-primary rounded-pill px-3" data-bs-toggle="modal" data-bs-target="#total-order-modal">View All</button>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-custom mb-0">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    List<Orders> recentOrders = orderDao.findAll();
                                    int count = 0;
                                    for (Orders o : recentOrders) {
                                        if (count >= 5) break;
                                        Optional<User> ou = userDao.findById(o.getUserId());
                                        if (ou.isPresent()) {
                                            User u = ou.get();
                                    %>
                                    <tr>
                                        <td class="fw-bold text-primary">#<%=o.getOrderId()%></td>
                                        <td><%=u.getFirstname()%> <%=u.getLastname()%></td>
                                        <td>
                                            <% if("Delivered".equals(o.getDeliveryStatus())) { %>
                                                <span class="badge bg-success bg-opacity-10 text-success border border-success rounded-pill px-3"><%=o.getDeliveryStatus()%></span>
                                            <% } else if("Pending".equals(o.getDeliveryStatus())) { %>
                                                <span class="badge bg-warning bg-opacity-10 text-warning border border-warning rounded-pill px-3"><%=o.getDeliveryStatus()%></span>
                                            <% } else { %>
                                                <span class="badge bg-info bg-opacity-10 text-info border border-info rounded-pill px-3"><%=o.getDeliveryStatus()%></span>
                                            <% } %>
                                        </td>
                                    </tr>
                                    <% 
                                            count++;
                                        } 
                                    } 
                                    if(count == 0) {
                                    %>
                                    <tr><td colspan="3" class="text-center py-4 text-muted">No recent orders.</td></tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-6 animate-slide-up" style="animation-delay: 0.1s;">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <div class="card-header bg-white border-bottom p-4 d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 text-dark"><i class="fa-solid fa-bell-concierge me-2 text-warning"></i> Latest Menu Items</h5>
                        <button class="btn btn-sm btn-outline-warning rounded-pill px-3" data-bs-toggle="modal" data-bs-target="#show-product-modal">Manage</button>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-custom mb-0">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Price</th>
                                        <th>Discount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    List<Food> recentFood = foodDao.findAll();
                                    int fCount = 0;
                                    for (Food f : recentFood) {
                                        if (fCount >= 5) break;
                                    %>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center gap-3">
                                                <img src="resources/productpic/<%=f.getImagePath()%>" class="rounded-3 shadow-sm" style="width: 40px; height: 40px; object-fit: cover;">
                                                <span class="fw-bold text-dark"><%=f.getName()%></span>
                                            </div>
                                        </td>
                                        <td class="fw-bold text-success">&#8377;<%=f.getPrice()%></td>
                                        <td><span class="badge bg-danger rounded-pill px-2"><%=f.getDiscount()%>%</span></td>
                                    </tr>
                                    <% 
                                        fCount++;
                                    } 
                                    if(fCount == 0) {
                                    %>
                                    <tr><td colspan="3" class="text-center py-4 text-muted">No items available.</td></tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals Section -->
    
    <!-- Add Category Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-folder-plus text-primary me-2"></i>Add Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="addcategory" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="catName" name="name" placeholder="Category Title" required>
                            <label for="catName">Category Title</label>
                        </div>
                        <div class="form-floating mb-4">
                            <textarea class="form-control" id="catDesc" name="description" placeholder="Description" style="height: 100px" required></textarea>
                            <label for="catDesc">Category Description</label>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="button" class="btn btn-light rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary rounded-pill px-4">Save Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Food Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-pizza-slice text-primary me-2"></i>Add Menu Item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="addfood" method="post" enctype="multipart/form-data">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="foodName" name="name" placeholder="Title" required>
                            <label for="foodName">Food Title</label>
                        </div>
                        <div class="form-floating mb-3">
                            <textarea class="form-control" id="foodDesc" name="description" placeholder="Description" style="height: 100px" required></textarea>
                            <label for="foodDesc">Description</label>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="foodPrice" name="price" placeholder="Price" required>
                                    <label for="foodPrice">Price (&#8377;)</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="foodDiscount" name="discount" placeholder="Discount" required>
                                    <label for="foodDiscount">Discount (%)</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="foodCategory" name="categoryId" required>
                                <option value="" disabled selected>Select a category</option>
                                <% for (Category category : li) { %>
                                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                                <% } %>
                            </select>
                            <label for="foodCategory">Category</label>
                        </div>
                        <div class="mb-4 bg-light p-3 rounded-3 border">
                            <label for="foodImage" class="form-label text-muted fw-bold small text-uppercase">Upload Image</label>
                            <input class="form-control border-0 bg-white shadow-sm" type="file" id="foodImage" name="image" required>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="button" class="btn btn-light rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary rounded-pill px-4">Publish Item</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals for tables (Users, Categories, Foods, Orders) -->
    <!-- Customers Modal -->
    <div class="modal fade" id="show-users-modal" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-users text-primary me-2"></i>Customers</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-0">
                    <div class="table-responsive">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                    <th>Address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (User u : listOfAllUsers) { %>
                                <tr>
                                    <td class="ps-4 fw-bold text-primary">#<%=u.getId()%></td>
                                    <td class="fw-bold"><%=u.getFirstname()%> <%=u.getLastname()%></td>
                                    <td><%=u.getEmailid()%></td>
                                    <td><i class="fa-solid fa-phone text-muted me-2"></i><%=u.getMobileno()%></td>
                                    <td><small class="text-muted"><%=u.getStreet()%>, <%=u.getCity()%> - <%=u.getPincode()%></small></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Categories Modal -->
    <div class="modal fade" id="show-category-modal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-list text-primary me-2"></i>Categories</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-0">
                    <div class="table-responsive">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th class="text-end pe-4">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Category c : categoryDao.findAll()) { %>
                                <tr>
                                    <td class="ps-4 fw-bold text-primary">#<%=c.getId()%></td>
                                    <td class="fw-bold"><%=c.getName()%></td>
                                    <td><small class="text-muted"><%=c.getDescription()%></small></td>
                                    <td class="text-end pe-4">
                                        <a href="deletecategory?categoryId=<%=c.getId()%>" class="btn btn-sm btn-outline-danger rounded-pill px-3 shadow-sm">
                                            <i class="fa-solid fa-trash me-1"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Foods Modal -->
    <div class="modal fade" id="show-product-modal" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-burger text-primary me-2"></i>Menu Items</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-0">
                    <div class="table-responsive">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">Item</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th class="text-end pe-4">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Food p : foodDao.findAll()) { 
                                       Category cat = null;
                                       Optional<Category> opt = categoryDao.findById(p.getCategoryId());
                                       if(opt.isPresent()) cat = opt.get();
                                %>
                                <tr>
                                    <td class="ps-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <img src="resources/productpic/<%=p.getImagePath()%>" class="rounded-3 shadow-sm" style="width: 50px; height: 50px; object-fit: cover;">
                                            <div>
                                                <h6 class="mb-0 fw-bold text-dark"><%=p.getName()%></h6>
                                                <small class="text-muted text-truncate d-inline-block" style="max-width: 250px;"><%=p.getDescription()%></small>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-light text-dark border px-2 py-1"><%=cat.getName()%></span></td>
                                    <td>
                                        <div class="fw-bold text-success">&#8377;<%=p.getPrice()%></div>
                                        <small class="badge bg-danger rounded-pill"><%=p.getDiscount()%>% OFF</small>
                                    </td>
                                    <td class="text-end pe-4">
                                        <a href="updatefood?foodId=<%=p.getId()%>" class="btn btn-sm btn-outline-primary rounded-pill px-3 shadow-sm me-2">Edit</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Orders Modal -->
    <div class="modal fade" id="total-order-modal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content border-0">
                <div class="modal-header bg-white border-bottom p-4">
                    <h5 class="modal-title fw-bold text-dark"><i class="fa-solid fa-clipboard-list text-primary me-2"></i>Manage Orders</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-0 bg-light">
                    <% List<Orders> lor = orderDao.findAll();
                       if (lor == null || lor.isEmpty()) { %>
                    <div class="text-center py-5 mt-5">
                        <i class="fa-solid fa-box-open fa-5x text-muted mb-4 opacity-50"></i>
                        <h3 class="text-muted fw-bold">No orders found</h3>
                    </div>
                    <% } else { %>
                    <div class="container-fluid p-4">
                        <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                            <div class="table-responsive">
                                <table class="table table-custom mb-0">
                                    <thead>
                                        <tr>
                                            <th class="ps-4">Order ID</th>
                                            <th>Customer</th>
                                            <th>Item & Qty</th>
                                            <th>Total Amount</th>
                                            <th>Timeline</th>
                                            <th>Status</th>
                                            <th class="text-end pe-4">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Orders o : lor) {
                                            Optional<Food> of = foodDao.findById(o.getFoodId());
                                            Food f = of.orElse(null);
                                            Optional<User> ou = userDao.findById(o.getUserId());
                                            User u = ou.orElse(null);
                                            if(f != null && u != null) {
                                        %>
                                        <tr>
                                            <td class="ps-4 fw-bold text-primary">#<%=o.getOrderId()%></td>
                                            <td>
                                                <div class="fw-bold"><%=u.getFirstname()%> <%=u.getLastname()%></div>
                                                <small class="text-muted"><i class="fa-solid fa-phone me-1"></i><%=u.getMobileno()%></small>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <img src="resources/productpic/<%=f.getImagePath()%>" class="rounded shadow-sm" style="width: 40px; height: 40px; object-fit: cover;">
                                                    <div>
                                                        <div class="fw-bold text-dark"><%=f.getName()%></div>
                                                        <span class="badge bg-secondary rounded-pill">Qty: <%=o.getQuantity()%></span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="fw-bold text-success fs-5">&#8377;<%=(new Helper().getFoodSellingPrice(f.getPrice(), f.getDiscount())) * o.getQuantity()%></div>
                                            </td>
                                            <td>
                                                <div class="small text-muted mb-1"><i class="fa-regular fa-calendar me-1"></i>Ordered: <strong class="text-dark"><%=o.getOrderDate()%></strong></div>
                                                <div class="small text-muted"><i class="fa-solid fa-truck-fast me-1"></i>Delivery: <strong class="text-dark"><%=o.getDeliveryDate()%></strong></div>
                                            </td>
                                            <td>
                                                <% if("Delivered".equals(o.getDeliveryStatus())) { %>
                                                    <span class="badge bg-success bg-opacity-10 text-success border border-success rounded-pill px-3 py-2"><i class="fa-solid fa-check me-1"></i> Delivered</span>
                                                <% } else if("Pending".equals(o.getDeliveryStatus())) { %>
                                                    <span class="badge bg-warning bg-opacity-10 text-warning border border-warning rounded-pill px-3 py-2"><i class="fa-solid fa-clock me-1"></i> Pending</span>
                                                <% } else { %>
                                                    <span class="badge bg-info bg-opacity-10 text-info border border-info rounded-pill px-3 py-2"><i class="fa-solid fa-spinner me-1"></i> <%=o.getDeliveryStatus()%></span>
                                                <% } %>
                                            </td>
                                            <td class="pe-4 text-end">
                                                <form action="updatedeliverydate" class="d-flex align-items-center justify-content-end gap-2" style="min-width: 320px;">
                                                    <input type="hidden" name="orderId" value="<%=o.getOrderId()%>">
                                                    <input type="date" class="form-control shadow-sm" name="deliveryDate" required>
                                                    <select name="deliveryStatus" class="form-select shadow-sm" style="width: 140px;">
                                                        <option value="Pending" <%="Pending".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Pending</option>
                                                        <option value="Processing" <%="Processing".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Processing</option>
                                                        <option value="On the Way" <%="On the Way".equals(o.getDeliveryStatus()) ? "selected" : ""%>>On the Way</option>
                                                        <option value="Delivered" <%="Delivered".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Delivered</option>
                                                    </select>
                                                    <button type="submit" class="btn btn-primary shadow-sm"><i class="fa-solid fa-floppy-disk"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% } } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <style>
        .cursor-pointer { cursor: pointer; }
    </style>

    <%@ include file="./components/footer.jsp"%>
</body>
</html>