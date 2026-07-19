<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Login - FoodBite</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid p-0 animate-fade">
    <div class="row g-0">
        <!-- Left Side Image -->
        <div class="col-lg-6 d-none d-lg-flex position-relative align-items-center justify-content-center" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.9), rgba(30, 64, 175, 0.9)), url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=2070') center/cover; min-height: calc(100vh - 70px);">
            <div class="position-relative text-center text-white p-5 z-index-1">
                <div class="bg-white rounded-circle d-inline-flex p-4 mb-4 text-primary shadow-lg">
                    <i class="fa-solid fa-utensils fa-3x"></i>
                </div>
                <h1 class="display-4 fw-bold mb-3">Craving Something?</h1>
                <p class="lead fs-5 opacity-75">Log in to track your orders, save your favorites, and explore the best food in town.</p>
            </div>
        </div>
        
        <!-- Right Side Form -->
        <div class="col-lg-6 d-flex align-items-center justify-content-center bg-white" style="min-height: calc(100vh - 70px);">
            <div class="w-100 p-4 p-sm-5" style="max-width: 500px;">
                <div class="text-center mb-5">
                    <h2 class="fw-bold text-dark">Welcome Back</h2>
                    <p class="text-muted">Enter your details to proceed as a Customer.</p>
                </div>
                
                <%@ include file="./components/message.jsp"%>
                
                <form action="userlogin" method="post">
                    <div class="form-floating mb-4">
                        <input type="email" class="form-control" id="username" name="emailid" placeholder="name@example.com" required>
                        <label for="username"><i class="fa-solid fa-envelope me-2"></i>Email Address</label>
                    </div>
                    
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="password"><i class="fa-solid fa-lock me-2"></i>Password</label>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="rememberMe">
                            <label class="form-check-label text-muted" for="rememberMe">Remember me</label>
                        </div>
                        <a href="#" data-bs-toggle="modal" data-bs-target=".forgetpasswordmodal" class="text-primary text-decoration-none fw-bold hover-link">Forgot password?</a>
                    </div>
                    
                    <button class="btn btn-primary w-100 py-3 fw-bold fs-5 shadow-sm mb-4" type="submit">
                        <i class="fa-solid fa-arrow-right-to-bracket me-2"></i> Sign In
                    </button>
                    
                    <div class="text-center">
                        <p class="text-muted mb-0">Don't have an account? <a href="userregister" class="text-primary text-decoration-none fw-bold ms-1 hover-link">Create one</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>