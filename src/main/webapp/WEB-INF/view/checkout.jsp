<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    String amount = (String)request.getAttribute("amount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Food Ordering</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body class="bg-light d-flex flex-column min-vh-100">
<%@ include file="./components/navbar.jsp"%>

<div class="container py-5 flex-grow-1">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="fw-bold mb-0">Secure Checkout</h2>
            <p class="text-muted">Almost there! Complete your payment to place the order.</p>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-8 mb-4 mb-lg-0">
            <!-- Step 1: Delivery Address (Mockup for UI based on standard Food Apps) -->
            <div class="card shadow-sm border-0 rounded-4 mb-4">
                <div class="card-header bg-white border-bottom py-3 d-flex align-items-center">
                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3 fw-bold" style="width: 30px; height: 30px;">1</div>
                    <h5 class="mb-0 fw-bold">Delivery Address</h5>
                </div>
                <div class="card-body p-4">
                    <div class="border rounded-3 p-3 position-relative">
                        <span class="badge bg-success position-absolute top-0 end-0 mt-3 me-3"><i class="fa-solid fa-check me-1"></i> Selected</span>
                        <div class="d-flex align-items-start">
                            <i class="fa-solid fa-location-dot fs-4 text-primary me-3 mt-1"></i>
                            <div>
                                <h6 class="fw-bold mb-1">Default Address</h6>
                                <p class="text-muted mb-0">Delivery to the address registered with your account.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Step 2: Payment Method -->
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-white border-bottom py-3 d-flex align-items-center">
                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3 fw-bold" style="width: 30px; height: 30px;">2</div>
                    <h5 class="mb-0 fw-bold">Payment Method</h5>
                </div>
                <div class="card-body p-4">
                    <form action="order" method="post" id="checkoutForm">
                        <input type="hidden" id="amount" name="amount" value="<%=amount %>">
                        
                        <div class="border rounded-3 p-3 mb-3 bg-light" style="cursor: pointer;">
                            <div class="form-check d-flex align-items-center mb-0">
                                <input class="form-check-input mt-0 me-3 fs-5" type="radio" name="paymentMethod" id="cod" value="cod" checked>
                                <label class="form-check-label flex-grow-1 d-flex align-items-center fw-bold" for="cod" style="cursor: pointer;">
                                    <div class="bg-white p-2 rounded shadow-sm me-3 text-success">
                                        <i class="fa-solid fa-money-bill-wave fs-4"></i>
                                    </div>
                                    <div>
                                        Cash on Delivery
                                        <small class="d-block text-muted fw-normal">Pay with cash when your order arrives.</small>
                                    </div>
                                </label>
                            </div>
                        </div>
                        
                        <div class="border rounded-3 p-3 mb-3 bg-light" style="cursor: pointer;">
                            <div class="form-check d-flex align-items-center mb-0">
                                <input class="form-check-input mt-0 me-3 fs-5" type="radio" name="paymentMethod" id="online" value="online">
                                <label class="form-check-label flex-grow-1 d-flex align-items-center fw-bold" for="online" style="cursor: pointer;">
                                    <div class="bg-white p-2 rounded shadow-sm me-3 text-primary">
                                        <i class="fa-regular fa-credit-card fs-4"></i>
                                    </div>
                                    <div>
                                        Online Payment (Razorpay)
                                        <small class="d-block text-muted fw-normal">Pay securely via Razorpay (Dummy).</small>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4">
            <!-- Order Summary -->
            <div class="card shadow-sm border-0 rounded-4 sticky-top" style="top: 100px;">
                <div class="card-body p-4">
                    <h5 class="fw-bold border-bottom pb-3 mb-3"><i class="fa-solid fa-receipt me-2 text-primary"></i> Order Summary</h5>
                    
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Item Total</span>
                        <span class="fw-bold">&#8377;<%=amount %></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Delivery Fee</span>
                        <span class="text-success fw-bold">FREE</span>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <span class="text-muted">Taxes & Charges</span>
                        <span class="text-success fw-bold">Included</span>
                    </div>
                    
                    <hr class="border-secondary border-opacity-25">
                    
                    <div class="d-flex justify-content-between align-items-end mb-4">
                        <span class="fw-bold fs-5">To Pay</span>
                        <span class="fw-bold fs-3 text-primary">&#8377;<%=amount %></span>
                    </div>
                    
                    <button type="button" class="btn btn-primary w-100 py-3 fw-bold fs-5 shadow-sm rounded-pill" onclick="handleCheckout()">
                        Confirm Order <i class="fa-solid fa-arrow-right ms-2"></i>
                    </button>
                    
                    <div class="text-center mt-3">
                        <p class="text-muted small mb-0"><i class="fa-solid fa-shield-halved me-1 text-success"></i> Safe and secure payments</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="./components/footer.jsp"%>
<script>
// Dummy Razorpay implementation to avoid API Key validation errors
class Razorpay {
    constructor(options) {
        this.options = options;
    }
    on(event, callback) {
        this[event] = callback;
    }
    open() {
        const response = {
            razorpay_payment_id: "pay_dummy_" + Math.random().toString(36).substring(2, 10)
        };
        setTimeout(() => {
            if(confirm("DUMMY RAZORPAY MODAL\nAmount: " + (this.options.amount / 100) + " INR\nClick OK to simulate successful payment.")) {
                this.options.handler(response);
            } else {
                if(this['payment.failed']) {
                    this['payment.failed']({error: {description: "User cancelled dummy payment"}});
                }
            }
        }, 300);
    }
}

function handleCheckout() {
    var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    var amount = document.getElementById('amount').value;
    
    if (paymentMethod === 'online') {
        var options = {
            "key": "rzp_test_dummykey", // Dummy Key ID
            "amount": amount * 100, // Amount is in currency subunits. Default currency is INR.
            "currency": "INR",
            "name": "Food Ordering System",
            "description": "Test Transaction",
            "handler": function (response){
                alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                document.getElementById('checkoutForm').submit();
            },
            "prefill": {
                "name": "Test User",
                "email": "test.user@example.com",
                "contact": "9999999999"
            },
            "theme": {
                "color": "#0d6efd"
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.on('payment.failed', function (response){
                alert("Payment failed: " + response.error.description);
        });
        rzp1.open();
    } else {
        document.getElementById('checkoutForm').submit();
    }
}
</script>
</body>
</html>