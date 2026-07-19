<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Delivery Partner Registration - FoodBite</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid p-0 animate-fade">
    <div class="row g-0">
        <!-- Left Side Form -->
        <div class="col-lg-7 d-flex align-items-center justify-content-center bg-white" style="min-height: calc(100vh - 70px);">
            <div class="w-100 p-4 p-md-5" style="max-width: 700px;">
                <div class="mb-5 text-center text-lg-start">
                    <h2 class="fw-bold text-dark">Become a Delivery Partner</h2>
                    <p class="text-muted">Join our fleet and earn on your own schedule.</p>
                </div>
                
                <%@ include file="./components/message.jsp"%>
                
                <form action="deliveryregister" method="post">
                    <div class="row g-4 mb-4">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" required>
                                <label for="firstname">First Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" required>
                                <label for="lastname">Last Name</label>
                            </div>
                        </div>
                    </div>

                    <div class="row g-4 mb-4">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="email" class="form-control" id="emailid" name="emailid" placeholder="name@example.com" required>
                                <label for="emailid"><i class="fa-solid fa-envelope me-2"></i>Email Address</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="mobileno" name="mobileno" placeholder="Mobile Number" required>
                                <label for="mobileno"><i class="fa-solid fa-phone me-2"></i>Mobile Number</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-floating mb-4">
                        <input type="text" class="form-control" id="street" name="street" placeholder="Street Address" required>
                        <label for="street"><i class="fa-solid fa-map-location-dot me-2"></i>Street Address</label>
                    </div>
                    
                    <div class="row g-4 mb-4">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="city" name="city" placeholder="City" required>
                                <label for="city"><i class="fa-solid fa-city me-2"></i>City</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Pin Code" required>
                                <label for="pincode"><i class="fa-solid fa-map-pin me-2"></i>Pin Code</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="password"><i class="fa-solid fa-lock me-2"></i>Password</label>
                        <div class="form-text mt-2"><i class="fa-solid fa-circle-info me-1"></i>Must be 8-20 characters long.</div>
                    </div>
                    
                    <button class="btn btn-primary w-100 py-3 fw-bold fs-5 shadow-sm mt-2 mb-4" type="submit">
                        <i class="fa-solid fa-motorcycle me-2"></i> Apply Now
                    </button>
                    
                    <div class="text-center">
                        <p class="text-muted mb-0">Already a partner? <a href="deliverylogin" class="text-primary text-decoration-none fw-bold ms-1 hover-link">Log in here</a></p>
                    </div>
                </form>
            </div>
        </div>

        <!-- Right Side Image -->
        <div class="col-lg-5 d-none d-lg-flex position-relative align-items-center justify-content-center" style="background: linear-gradient(135deg, rgba(34, 197, 94, 0.8), rgba(30, 64, 175, 0.9)), url('https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?auto=format&fit=crop&q=80&w=2071') center/cover;">
            <div class="position-relative text-center text-white p-5 z-index-1">
                <div class="bg-white rounded-circle d-inline-flex p-4 mb-4 text-success shadow-lg">
                    <i class="fa-solid fa-motorcycle fa-3x"></i>
                </div>
                <h1 class="display-5 fw-bold mb-3">Drive with Us</h1>
                <p class="lead fs-5 opacity-75">Deliver smiles across the city and earn on your own schedule.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>
