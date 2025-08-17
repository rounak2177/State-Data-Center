<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<section class="container" style="margin-top: 140px; min-height: 80vh;">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <h2 class="mb-4 text-center" style="color: #00796B;">Organisation Sign-in</h2>

      <!-- Error Display -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
      </c:if>

      <!-- Login Form -->
      <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="mb-3">
          <label for="email" class="form-label">E-mail Address <span class="text-danger">*</span></label>
          <input type="email" name="email" id="email" class="form-control"
                 placeholder="Enter registered email address" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Captcha <span class="text-danger">*</span></label>
          <div class="d-flex align-items-center mb-2">
            <img src="${pageContext.request.contextPath}/captcha" alt="Captcha"
                 style="height: 38px; border: 1px solid #ccc; margin-right: 10px;" />
            <a href="#" onclick="location.reload();" class="text-decoration-none">Refresh</a>
          </div>
          <input type="text" name="captcha" class="form-control" placeholder="Enter Captcha code" required>
        </div>

        <div class="d-grid mb-3">
          <button type="submit" class="btn" 
                  style="background-color: #00796B; color: white; border: none;">
            Login
          </button>
        </div>

        <p class="text-center">
          If you are not registered, please
          <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">register now</a>.
        </p>
      </form>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>

<style>
/* Hover effect for the Login button */
.btn:hover {
  background-color: #00665B !important;
  color: white !important;
}
</style>
