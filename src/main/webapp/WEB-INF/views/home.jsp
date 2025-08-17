<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" />

<%@ include file="includes/header.jsp" %>
<section class="starter-section">
    <h1>Welcome to State Data Centre</h1>
    <p>A unified platform for government organisation registration and access</p>
    <a href="${pageContext.request.contextPath}/register" class="btn">Register Now</a>
</section>

<div style="text-align:center; margin-top: 50px;">
    <h2>Welcome to the Data Center Management System</h2>
    <p>Please <a href="login">Login</a> or <a href="register">Register</a> to continue.</p>
</div>

<%@ include file="includes/footer.jsp" %>
