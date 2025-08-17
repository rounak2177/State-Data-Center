<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>State Data Center Management System</title>
    <link href="assets/css/main.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: "Nunito Sans", sans-serif;
        }

        header {
            background-color: #003366;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .text h2 {
            margin: 0;
            font-size: 24px;
        }

        header .text h4 {
            margin: 4px 0 0 0;
            font-weight: normal;
            font-size: 14px;
        }

        nav a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .hero {
            padding: 80px 40px;
            text-align: center;
            background: #f4f7fa;
        }

        .hero h1 {
            font-size: 36px;
            color: #333;
        }

        .hero p {
            font-size: 18px;
            color: #666;
        }

        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<header>
    <div class="text">
        <h2>State Data Center Management System</h2>
        <h4>Department of West Bengal Electronics Industry Development Corporation Limited</h4>
    </div>
    <nav>
        <a href="/">Home</a>
        <a href="/login">Login</a>
        <a href="/register">Register</a>
        <a href="/about">About</a>
        <a href="/contact">Contact Us</a>
    </nav>
</header>

<section class="hero">
    <h1>Welcome to the State Data Center Management System</h1>
    <p>Ensuring secure, efficient, and seamless digital services for departments across West Bengal.</p>
</section>

<footer>
    &copy; 2025 Government of West Bengal. All rights reserved.
</footer>

</body>
</html>
