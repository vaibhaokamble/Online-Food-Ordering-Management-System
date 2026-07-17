<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivery Dashboard</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<div class="container-fluid mt-4">
		<%@ include file="./components/message.jsp"%>
		<h2 class="text-center mb-4" style="color:#0a3d62;">Delivery Dashboard - Manage Orders</h2>

		<%
		List<Orders> lor = orderDao.findAll();
		if (lor == null || lor.isEmpty()) {
		%>
		<div class="text-center">
			<h1>NO ORDERS CURRENTLY AVAILABLE !!</h1>
			<hr>
		</div>
		<%
		} else {
		%>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead class="custom-bg text-white">
					<tr class="text-center text-color">
						<th scope="col">Order Id</th>
						<th scope="col">User Name</th>
						<th scope="col">User Phone</th>
						<th scope="col">User Address</th>
						<th scope="col">Food Title</th>
						<th scope="col">Qnty</th>
						<th scope="col">Price</th>
						<th scope="col">Ord. date</th>
						<th scope="col">Delivery date</th>
						<th scope="col">Delivery Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>

				<tbody>
					<%
					for (Orders o : lor) {
						Optional<Food> of = foodDao.findById(o.getFoodId());
						Food f = null;
						if (of.isPresent()) {
							f = of.get();
						}

						Optional<User> ou = userDao.findById(o.getUserId());
						User u = null;
						if (ou.isPresent()) {
							u = ou.get();
						}
					%>
					<tr class="text-center">
						<td class="mid-align"><%=o.getOrderId()%></td>
						<td class="mid-align"><%=u != null ? u.getFirstname() : ""%></td>
						<td class="mid-align"><%=u != null ? u.getMobileno() : ""%></td>
						<td class="mid-align"><%=u != null ? u.getStreet() + ", " + u.getCity() + " " + u.getPincode() : ""%></td>
						<td class="mid-align"><%=f != null ? f.getName() : ""%></td>
						<td class="mid-align"><%=o.getQuantity()%></td>
						<td class="mid-align"><%=f != null ? (new Helper().getFoodSellingPrice(f.getPrice(), f.getDiscount())) * o.getQuantity() : ""%></td>
						<td class="mid-align"><%=o.getOrderDate()%></td>
						<td class="mid-align"><%=o.getDeliveryDate()%></td>
						<td class="mid-align"><%=o.getDeliveryStatus()%></td>
						<td class="mid-align">
							<form action="updatedeliverydate">
								<input type="hidden" name="orderId" value=<%=o.getOrderId()%>>
								<div class="form-group mb-2">
									<input type="date" class="form-control" name="deliveryDate" placeholder="Delivery Date" required>
								</div>
								<div class="form-group mb-2">
									<select name="deliveryStatus" class="form-control">
										<option value="Pending" <%= o.getDeliveryStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
										<option value="Processing" <%= o.getDeliveryStatus().equals("Processing") ? "selected" : "" %>>Processing</option>
										<option value="On the Way" <%= o.getDeliveryStatus().equals("On the Way") ? "selected" : "" %>>On the Way</option>
										<option value="Delivered" <%= o.getDeliveryStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
									</select>
								</div>
								<button type="submit" class="btn custom-bg text-white mb-2">Update</button>
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
