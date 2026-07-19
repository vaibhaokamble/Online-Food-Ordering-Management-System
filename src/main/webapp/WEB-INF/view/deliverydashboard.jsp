<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Delivery Dashboard - FoodBite</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body class="bg-light">
    <%@ include file="./components/navbar.jsp"%>

    <div class="container-fluid px-4 px-lg-5 py-4 animate-fade">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Rider Dashboard</h2>
                <p class="text-muted mb-0">Manage and update your assigned deliveries.</p>
            </div>
            <div>
                <div class="bg-success text-white px-4 py-2 rounded-pill fw-bold shadow-sm d-flex align-items-center">
                    <span class="spinner-grow spinner-grow-sm me-2" role="status" aria-hidden="true"></span> Online
                </div>
            </div>
        </div>

        <%@ include file="./components/message.jsp"%>

        <!-- Deliveries List -->
        <div class="card shadow-sm border-0 rounded-4 mb-5 bg-white overflow-hidden animate-slide-up">
            <div class="card-header bg-white border-bottom p-4">
                <h5 class="fw-bold mb-0 text-dark"><i class="fa-solid fa-motorcycle me-2 text-primary"></i> Active Deliveries</h5>
            </div>
            <div class="card-body p-0">
                <%
                List<Orders> lor = orderDao.findAll();
                if (lor == null || lor.isEmpty()) {
                %>
                <div class="text-center py-5 my-4">
                    <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 120px; height: 120px;">
                        <i class="fa-solid fa-mug-hot fa-3x text-muted opacity-50"></i>
                    </div>
                    <h4 class="fw-bold text-dark">No active deliveries</h4>
                    <p class="text-muted">Take a break! We'll notify you when new orders arrive.</p>
                </div>
                <%
                } else {
                %>
                <!-- Card based layout for better mobile experience for riders -->
                <div class="row g-0">
                    <%
                    for (Orders o : lor) {
                        Optional<Food> of = foodDao.findById(o.getFoodId());
                        Food f = of.orElse(null);

                        Optional<User> ou = userDao.findById(o.getUserId());
                        User u = ou.orElse(null);
                    %>
                    <div class="col-12 border-bottom p-4 hover-bg transition-all">
                        <div class="row align-items-center">
                            <div class="col-md-3 mb-3 mb-md-0">
                                <span class="badge bg-primary bg-opacity-10 text-primary border border-primary px-3 py-2 rounded-pill mb-3"><i class="fa-solid fa-hashtag me-1"></i><%=o.getOrderId()%></span>
                                <h5 class="fw-bold mb-1 text-dark"><%=u != null ? u.getFirstname() + " " + u.getLastname() : "Unknown Customer"%></h5>
                                <% if(u != null) { %>
                                <div class="text-muted small"><i class="fa-solid fa-phone me-1"></i> <%=u.getMobileno()%></div>
                                <% } %>
                            </div>
                            <div class="col-md-4 mb-3 mb-md-0">
                                <h6 class="fw-bold text-uppercase text-muted small mb-2"><i class="fa-solid fa-location-dot me-1 text-danger"></i> Delivery Address</h6>
                                <% if(u != null) { %>
                                <p class="mb-0 fw-medium text-dark bg-light p-3 rounded-3 border"><%=u.getStreet()%>, <%=u.getCity()%> - <%=u.getPincode()%></p>
                                <% } %>
                            </div>
                            <div class="col-md-2 mb-3 mb-md-0 text-md-center">
                                <h6 class="fw-bold text-uppercase text-muted small mb-2">Status</h6>
                                <% if("Delivered".equals(o.getDeliveryStatus())) { %>
                                    <span class="badge bg-success bg-opacity-10 text-success border border-success px-3 py-2 rounded-pill"><i class="fa-solid fa-check me-1"></i> Delivered</span>
                                <% } else if("Pending".equals(o.getDeliveryStatus())) { %>
                                    <span class="badge bg-warning bg-opacity-10 text-warning border border-warning px-3 py-2 rounded-pill"><i class="fa-solid fa-clock me-1"></i> Pending</span>
                                <% } else { %>
                                    <span class="badge bg-info bg-opacity-10 text-info border border-info px-3 py-2 rounded-pill"><i class="fa-solid fa-motorcycle me-1"></i> <%=o.getDeliveryStatus()%></span>
                                <% } %>
                            </div>
                            <div class="col-md-3">
                                <form action="updatedeliverydate" class="bg-light p-3 rounded-3 border d-flex flex-column gap-2">
                                    <h6 class="fw-bold text-uppercase text-muted small mb-0">Update Progress</h6>
                                    <input type="hidden" name="orderId" value="<%=o.getOrderId()%>">
                                    <input type="date" class="form-control form-control-sm border-0 shadow-sm" name="deliveryDate" required>
                                    <select name="deliveryStatus" class="form-select form-select-sm border-0 shadow-sm">
                                        <option value="Pending" <%="Pending".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Pending</option>
                                        <option value="Processing" <%="Processing".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Processing</option>
                                        <option value="On the Way" <%="On the Way".equals(o.getDeliveryStatus()) ? "selected" : ""%>>On the Way</option>
                                        <option value="Delivered" <%="Delivered".equals(o.getDeliveryStatus()) ? "selected" : ""%>>Delivered</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm w-100 fw-bold mt-1 shadow-sm"><i class="fa-solid fa-cloud-arrow-up me-1"></i> Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
                <%
                }
                %>
            </div>
        </div>
        
        <style>
            .hover-bg:hover { background-color: #f8fafc; }
            .transition-all { transition: all 0.2s ease; }
        </style>
    </div>
    
    <%@ include file="./components/footer.jsp"%>
</body>
</html>
