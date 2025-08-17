<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<style>
    /* Push content down below the header */
    .admin-login-container {
        margin-top: 140px; /* Adjust to match header height */
        min-height: calc(100vh - 200px); /* Ensure footer at bottom */
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    /* Footer stick to bottom */
    footer {
        margin-top: auto;
    }

    /* Match Login button and heading with header/footer color */
    .btn-login {
        background-color: #00796B;
        border: none;
        color: white;
    }
    .btn-login:hover {
        background-color: #00665B;
        color: white;
    }
    .admin-heading {
        color: #00796B; /* Matches header/footer */
        font-weight: bold;
    }
</style>

<section class="container admin-login-container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <h2 class="admin-heading mb-4 text-center">Admin Login</h2>

      <!-- Flash or error message display -->
      <c:if test="${not empty msg}">
        <div class="alert alert-success text-center">${msg}</div>
      </c:if>
      <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
      </c:if>

      <form method="post" action="${pageContext.request.contextPath}/admin-login">
        <div class="mb-3">
          <label for="email" class="form-label">E-mail Address <span class="text-danger">*</span></label>
          <input type="email" name="email" id="email" class="form-control" placeholder="Please enter your email" required>
        </div>

        <div class="mb-4">
          <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
          <input type="password" name="password" id="password" class="form-control" placeholder="Please enter your password" required>
        </div>

        <div class="d-grid mb-3">
          <button type="submit" class="btn btn-login">Login</button>
        </div>

        <p class="text-center">
          Don’t have an account?
          <a href="${pageContext.request.contextPath}/admin-signup" class="text-decoration-none">Sign up</a>
        </p>
      </form>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>
