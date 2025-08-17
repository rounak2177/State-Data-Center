<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<section class="container mt-5 pt-5">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">

      <h2 class="text-primary mb-4 text-center">Create an Account</h2>

      <!-- Display flash or validation messages -->
      <c:if test="${not empty msg}">
        <div class="alert alert-success text-center">${msg}</div>
      </c:if>
      <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
      </c:if>

      <!-- Signup form -->
      <form action="${pageContext.request.contextPath}/admin-signup" method="post">
        <div class="mb-3">
          <label for="name" class="form-label">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
        </div>

        <div class="mb-3">
          <label for="mobile" class="form-label">Mobile Number <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter your mobile number" required>
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
        </div>

        <div class="d-grid mb-4">
          <button type="submit" class="btn btn-primary">Sign Up</button>
        </div>

        <p class="text-center">
          Already have an account?
          <a href="${pageContext.request.contextPath}/admin-login" class="text-decoration-none">Login</a>
        </p>
      </form>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>