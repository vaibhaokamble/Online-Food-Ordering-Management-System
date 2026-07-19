<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Delivery Partner Login - FoodBite</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid p-0 animate-fade">
    <div class="row g-0">
        <!-- Left Side Image -->
        <div class="col-lg-6 d-none d-lg-flex position-relative align-items-center justify-content-center" style="background: linear-gradient(135deg, rgba(34, 197, 94, 0.8), rgba(30, 64, 175, 0.9)), url('https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?auto=format&fit=crop&q=80&w=2071') center/cover; min-height: calc(100vh - 70px);">
            <div class="position-relative text-center text-white p-5 z-index-1">
                <div class="bg-white rounded-circle d-inline-flex p-4 mb-4 text-success shadow-lg">
                    <i class="fa-solid fa-motorcycle fa-3x"></i>
                </div>
                <h1 class="display-4 fw-bold mb-3">Drive with Us</h1>
                <p class="lead fs-5 opacity-75">Deliver smiles across the city and earn on your own schedule.</p>
            </div>
        </div>
        
        <!-- Right Side Form -->
        <div class="col-lg-6 d-flex align-items-center justify-content-center bg-white" style="min-height: calc(100vh - 70px);">
            <div class="w-100 p-4 p-sm-5" style="max-width: 500px;">
                <div class="text-center mb-5">
                    <h2 class="fw-bold text-dark">Delivery Partner</h2>
                    <p class="text-muted">Enter your details to view your tasks.</p>
                </div>
                
                <%@ include file="./components/message.jsp"%>
                
                <form action="deliverylogin" method="post">
                    <div class="form-floating mb-4">
                        <input type="email" class="form-control" id="username" name="emailid" placeholder="name@example.com" required>
                        <label for="username"><i class="fa-solid fa-envelope me-2"></i>Email Address</label>
                    </div>
                    
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="password"><i class="fa-solid fa-lock me-2"></i>Password</label>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <a href="#" data-bs-toggle="modal" data-bs-target=".forgetpasswordmodal" class="text-primary text-decoration-none fw-bold hover-link ms-auto">Forgot password?</a>
                    </div>
                    
                    <button class="btn btn-primary w-100 py-3 fw-bold fs-5 shadow-sm mb-4" type="submit">
                        <i class="fa-solid fa-arrow-right-to-bracket me-2"></i> Sign In
                    </button>
                    
                    <div class="text-center">
                        <p class="text-muted mb-0">Want to become a partner? <a href="deliveryregister" class="text-primary text-decoration-none fw-bold ms-1 hover-link">Apply now</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>
