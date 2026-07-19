<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Food - Online Food Ordering</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body class="bg-light d-flex flex-column min-vh-100">
<%@ include file="./components/navbar.jsp"%>
<%
   Food fod = (Food)request.getAttribute("food"); 
%>
<div class="container py-5 flex-grow-1">
  <div class="row justify-content-center">
       <div class="col-md-8 col-lg-6">
            <div class="card shadow border-0 rounded-4">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body p-5">
                    <div class="text-center mb-5">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3 shadow-sm" style="width: 80px; height: 80px;">
                            <i class="fa-solid fa-pen-to-square text-primary fs-1"></i>
                        </div>
                        <h3 class="fw-bold text-dark">Update Menu Item</h3>
                        <p class="text-muted">Modify food details and pricing</p>
                    </div>

            <form action="updatefood" method="post" enctype="multipart/form-data">
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="foodId" name="id" placeholder="Food Id" value="<%=fod.getId() %>" readonly>
                    <label for="foodId">Food Id (Read-Only)</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="foodName" name="name" placeholder="Food Title" value="<%=fod.getName() %>" required>
                    <label for="foodName">Food Title</label>
                </div>

                <div class="form-floating mb-3">
                    <textarea class="form-control" id="foodDesc" name="description" placeholder="Food Description" style="height: 150px" required><%=fod.getDescription() %></textarea>
                    <label for="foodDesc">Food Description</label>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="foodPrice" name="price" value="<%=fod.getPrice()%>" placeholder="Price" required>
                            <label for="foodPrice">Price (&#8377;)</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="foodDiscount" name="discount" value="<%=fod.getDiscount() %>" placeholder="Discount" required>
                            <label for="foodDiscount">Discount (%)</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <select class="form-select" id="foodCategory" name="categoryId" required>
                        <option value="">Select Category</option>
                        <%
                        for (Category category : categoryDao.findAll()) {
                        %>
                        <option value="<%=category.getId()%>" <%=fod.getCategoryId() == category.getId() ? "selected" : ""%>><%=category.getName()%></option>
                        <%
                        }
                        %>
                    </select>
                    <label for="foodCategory">Category</label>
                </div>

                <div class="mb-4">
                    <label for="foodImage" class="form-label text-muted ms-1">Update Food Image</label>
                    <input class="form-control" type="file" id="foodImage" name="image" required>
                </div>

                <div class="d-flex gap-3 mt-5">
                    <a href="admin" class="btn btn-light btn-lg py-3 fw-bold flex-grow-1 shadow-sm text-dark"><i class="fa-solid fa-arrow-left me-2"></i>Cancel</a>
                    <button class="btn btn-primary btn-lg py-3 fw-bold flex-grow-1 shadow-sm" type="submit">
                        <i class="fa-solid fa-save me-2"></i> Update Food
                    </button>
                </div>
            </form>
                </div>
            </div>
       </div>
  </div>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>