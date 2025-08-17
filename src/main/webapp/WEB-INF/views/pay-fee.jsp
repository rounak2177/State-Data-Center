<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<!-- Add spacing so content starts below fixed header -->
<section class="container" style="margin-top: 120px;">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <!-- Heading with header green color -->
      <h2 class="mb-4 text-center" style="color: #00796b;">Pay Fee</h2>

      <!-- Flash messages -->
      <c:if test="${not empty msg}">
        <div class="alert alert-success text-center">${msg}</div>
      </c:if>
      <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
      </c:if>

      <!-- Pay Fee Form -->
      <form method="post" action="${pageContext.request.contextPath}/pay-fee">
        <div class="mb-3">
          <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
          <input type="email" name="email" id="email" class="form-control" placeholder="Please enter your email" required>
        </div>

        <!-- Button styled to match header color -->
        <div class="d-grid mb-3">
          <button type="submit" class="btn" style="background-color: #00796b; color: white; border: none;">
            Check
          </button>
        </div>
      </form>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>
