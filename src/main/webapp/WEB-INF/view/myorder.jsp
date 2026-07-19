<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders - Online Food Ordering</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body class="bg-light d-flex flex-column min-vh-100">
<%@ include file="./components/navbar.jsp"%>

<div class="container py-5 flex-grow-1">
	
	<div class="row mb-4 align-items-center">
		<div class="col-md-6">
			<h2 class="fw-bold mb-0"><i class="fa-solid fa-clock-rotate-left me-2 text-primary"></i>My Orders</h2>
			<p class="text-muted">Track and review your past orders</p>
		</div>
		<div class="col-md-6">
			<div class="d-flex justify-content-md-end gap-2 mt-3 mt-md-0">
		       <form class="d-flex" action="searchorderbyid">
		            <div class="input-group">
		            	<input type="text" class="form-control" name="orderid" placeholder="Search by Order ID">
		            	<button type="submit" class="btn btn-outline-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
		            </div>
		       </form>
		       <a href="searchorderbydate?orderdate=<%=LocalDate.now().toString()%>&userid=<%=user.getId()%>" class="btn btn-custom">
		       		<i class="fa-solid fa-calendar-day me-1"></i> Today's Orders
		       </a>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<%
			    List<Orders> listOfOrders = (List<Orders>)request.getAttribute("orders");
			    
			    if(listOfOrders != null && !listOfOrders.isEmpty()) {
			%>
			<div class="row g-4">
			<%
			        for(Orders o : listOfOrders) {
			         	Optional<Food> of = foodDao.findById(o.getFoodId());
			            Food f = of.orElse(null);
			            
			            Optional<User> ou = userDao.findById(o.getUserId());
			            User u = ou.orElse(null);
			            
			            if(f != null && u != null) {
			%>
				<div class="col-lg-6">
					<div class="card shadow-sm border-0 rounded-4 h-100 hover-shadow transition-all">
						<div class="card-header bg-white border-bottom-0 pt-4 pb-0 px-4 d-flex justify-content-between align-items-center">
							<span class="badge bg-light text-dark border px-3 py-2 rounded-pill"><i class="fa-solid fa-hashtag text-primary me-1"></i><%=o.getOrderId() %></span>
							<% if("Delivered".equals(o.getDeliveryStatus())) { %>
								<span class="badge bg-success bg-opacity-10 text-success border border-success px-3 py-2 rounded-pill"><i class="fa-solid fa-circle-check me-1"></i> Delivered</span>
							<% } else if("Pending".equals(o.getDeliveryStatus())) { %>
								<span class="badge bg-warning bg-opacity-10 text-warning border border-warning px-3 py-2 rounded-pill"><i class="fa-solid fa-clock-rotate-left me-1"></i> Pending</span>
							<% } else { %>
								<span class="badge bg-info bg-opacity-10 text-info border border-info px-3 py-2 rounded-pill"><i class="fa-solid fa-truck me-1"></i> <%=o.getDeliveryStatus()%></span>
							<% } %>
						</div>
						<div class="card-body p-4">
							<div class="d-flex align-items-center mb-3">
								<img src="resources/productpic/<%=f.getImagePath() %>" class="rounded-3 shadow-sm object-fit-cover" style="width: 80px; height: 80px;" alt="food_pic">
								<div class="ms-3 flex-grow-1">
									<h5 class="fw-bold mb-1 text-dark"><%=f.getName() %></h5>
									<p class="text-muted small mb-0"><%=Helper.get10Words(f.getDescription()) %></p>
								</div>
							</div>
							
							<div class="bg-light rounded-3 p-3 mb-3 d-flex justify-content-between align-items-center">
								<div>
									<small class="text-muted d-block">Quantity</small>
									<span class="fw-bold fs-5"><%=o.getQuantity() %></span>
								</div>
								<div class="text-end">
									<small class="text-muted d-block">Total Paid</small>
									<span class="fw-bold fs-5 text-primary">&#8377;<%= (new Helper().getFoodSellingPrice(f.getPrice(), f.getDiscount())) * o.getQuantity() %></span>
								</div>
							</div>
							
							<div class="d-flex justify-content-between align-items-center text-muted small">
								<span><i class="fa-regular fa-calendar text-primary me-1"></i> Ordered: <%=o.getOrderDate() %></span>
								<span><i class="fa-regular fa-calendar-check text-success me-1"></i> Delivery: <%=o.getDeliveryStatus().equals("Delivered") ? o.getDeliveryDate() : "Pending" %></span>
							</div>
						</div>
						<div class="card-footer bg-white border-top-0 pb-4 px-4">
							<button class="btn btn-outline-primary w-100 rounded-pill fw-bold">Reorder</button>
						</div>
					</div>
				</div>
			<%
			            }
			        }
			%>
			</div>
			<%
			    } else {
			%>
			<div class="card shadow-sm border-0 rounded-4 text-center py-5">
				<div class="card-body py-5">
					<div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 100px; height: 100px;">
						<i class="fa-solid fa-basket-shopping fa-3x text-muted"></i>
					</div>
					<h3 class="fw-bold text-dark mb-2">No orders found</h3>
					<p class="text-muted mb-4 fs-5">Looks like you haven't placed any orders yet.</p>
					<a href="/" class="btn btn-primary btn-lg rounded-pill px-5 fw-bold shadow-sm">Explore Restaurants</a>
				</div>
			</div>
			<%
			    }
			%>
		</div>
	</div>
	
	<style>
		.hover-shadow:hover {
			box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important;
			transform: translateY(-3px);
		}
		.transition-all {
			transition: all 0.3s ease;
		}
	</style>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>