<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.time.LocalDate"%>
<%@ page import ="com.onlinefoodorder.model.*"%>
<%@ page import="com.onlinefoodorder.utility.*"%>
<%@ page import="com.onlinefoodorder.dao.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
    
<% 
    Food fod = (Food)request.getAttribute("food"); 
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=fod.getName() %> - Online Food Ordering</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body class="bg-light d-flex flex-column min-vh-100">
<%@ include file="./components/navbar.jsp"%>

<script type="text/javascript">
      function checkUser()
      {
    	  <%
    	      if(userType != null) {
    	    	  if(userType.equals("user")) {
    	  %>
    	             return true;
    	          <%
    	    	  } else {	  
    	    	  %>
    	    	  alert("Please login as customer to buy the product.");
    	    	  return false;
    	    	  <%
    	    	  }
    	      } else {
    	  %>
    	    	  alert("Please login to buy the product.");
    	    	  return false;
    	  <%
    	      }
    	  %>
      }
</script>

<div class="container-fluid py-5 flex-grow-1">
	<%@ include file="./components/message.jsp"%>
	
   <div class="row">
         <!-- Sidebar Categories -->
         <div class="col-lg-3 col-md-4 mb-4">
             <div class="category-list sticky-top" style="top: 100px;">
                 <h5 class="px-3 pt-2 pb-3 fw-bold text-dark border-bottom">Categories</h5>
                 <a href="category?categoryId=0" class="list-group-item list-group-item-action d-flex align-items-center active">
                  	<div class="bg-primary text-white rounded-circle d-flex justify-content-center align-items-center me-3" style="width: 32px; height: 32px;">
                        <i class="fa-solid fa-utensils fs-6"></i>
                    </div>
                    All Menus
                 </a>
               <%
                    for(Category c: categoryDao.findAll())
                    {    	
               %>      
                         <a href="category?categoryId=<%=c.getId() %>" class="list-group-item list-group-item-action d-flex align-items-center">
                          	<div class="bg-light text-muted rounded-circle d-flex justify-content-center align-items-center me-3" style="width: 32px; height: 32px;">
                                <i class="fa-solid fa-burger fs-6"></i>
                            </div>
                            <%=c.getName() %>
                         </a>
               <%
                    }
               %>
             </div>
        </div> 
        
        <!-- Food Details Section -->
        <div class="col-lg-9 col-md-8">
              <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4 bg-white">
                   <div class="row g-0">
                   		<!-- Image Side -->
                        <div class="col-xl-6 d-flex align-items-center justify-content-center p-0 position-relative">
                             <img src="resources/productpic/<%=fod.getImagePath() %>" class="img-fluid w-100 h-100" alt="food_image" style="object-fit: cover; min-height: 400px;">
                             <div class="position-absolute top-0 start-0 m-3">
                                 <span class="badge bg-success shadow-sm p-2 fs-6"><i class="fa-solid fa-leaf me-1"></i> Pure Veg</span>
                             </div>
                        </div>
                        
                        <!-- Info Side -->
                        <div class="col-xl-6">
                             <div class="card-body p-4 p-xl-5 d-flex flex-column h-100">
                                  <div class="d-flex justify-content-between align-items-start mb-2">
                                      <h2 class="fw-bold mb-0 text-dark"><%=fod.getName() %></h2>
                                      <button class="btn btn-light rounded-circle text-danger shadow-sm border" style="width: 45px; height: 45px;"><i class="fa-regular fa-heart fs-5"></i></button>
                                  </div>
                                  <div class="mb-4 d-flex align-items-center gap-3">
                                  		<span class="badge bg-success text-white fs-6 py-2 px-3 rounded-pill"><i class="fa-solid fa-star me-1"></i>4.8</span>
                                  		<span class="text-muted text-decoration-underline">124 Ratings</span>
                                        <span class="text-muted"><i class="fa-solid fa-clock text-primary me-1"></i> 30-40 mins</span>
                                  </div>
                                  
                                  <h6 class="fw-bold text-uppercase text-muted letter-spacing-1 mb-2">About this dish</h6>
                                  <p class="text-secondary mb-4" style="line-height: 1.8; font-size: 1.05rem;"><%=fod.getDescription() %></p>
                                  
                                  <div class="mt-auto pt-4 border-top">
                                  		<div class="d-flex align-items-center mb-4 bg-light p-3 rounded-4">
                                  			<span class="fs-1 fw-bold text-dark me-3">&#8377;<%=new Helper().getFoodSellingPrice(fod.getPrice(), fod.getDiscount()) %></span>
                                  			<div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="fs-5 text-muted text-decoration-line-through">&#8377;<%=fod.getPrice()%></span>
                                                    <span class="badge bg-warning text-dark py-1 px-2"><%=fod.getDiscount() %>% OFF</span>
                                                </div>
	                                  			<small class="text-success fw-bold d-block mt-1">Inclusive of all taxes</small>
                                  			</div>
                                  		</div>
                                        
                                       <%
                                           if(userType != null && userType.equals("user") || userType == null)
                                           {
                                       %>
                                       <form class="d-flex align-items-center gap-3" action="addToCart" onclick="return checkUser()">
                                          <input type="hidden" name="foodId" value="<%=fod.getId()%>">
                                          <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                          <% LocalDate date=LocalDate.now(); %>
                                          <input type="hidden" name="date" value="<%=date.toString()%>">
                                          
                                          <div class="input-group rounded-pill overflow-hidden border" style="width: 140px; height: 55px;">
                                              <button class="btn btn-light px-3 fw-bold fs-5 text-primary" type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">-</button>
                                              <input type="number" class="form-control text-center fw-bold fs-5 border-0 bg-white" name="quantity" value="1" min="1" required readonly style="width: 40px; padding: 0;">
                                              <button class="btn btn-light px-3 fw-bold fs-5 text-primary" type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">+</button>
                                          </div>
                                          
                                          <button type="submit" class="btn btn-primary flex-grow-1 shadow-sm fs-5 fw-bold" style="height: 55px; border-radius: 30px;">
                                          	Add to Cart <i class="fa-solid fa-arrow-right ms-2"></i>
                                          </button>
                                       </form>
                                      <%
                                           }
                                           else if(userType != null && userType.equals("admin"))
                                           {
                                      %> 
                                      <div class="d-flex gap-3">
                                              <a href="updatefood?foodId=<%=fod.getId()%>" class="btn btn-primary flex-grow-1 py-3 fw-bold rounded-pill"><i class="fa-solid fa-pen-to-square me-2"></i> Edit Food</a>
                                              <a href="deletefood?foodId=<%=fod.getId()%>" class="btn btn-outline-danger flex-grow-1 py-3 fw-bold rounded-pill"><i class="fa-solid fa-trash me-2"></i> Delete</a>
                                      </div>
                                      <%
                                           }
                                      %>
                                  </div>
                             </div>
                        </div>
                   </div>
              </div>
        </div>
   </div>
</div>

<%@ include file="./components/footer.jsp"%>
</body>
</html>