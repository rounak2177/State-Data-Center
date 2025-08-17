<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        .admin-home-container {
            margin-top: 120px; /* to avoid header overlap */
            min-height: 80vh; /* keep footer at bottom */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .admin-btn {
            width: 350px;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            background-color: #00796B; /* same as header/footer */
            border: none;
        }
        .admin-btn:hover {
            background-color: #005f53; /* darker shade on hover */
        }
    </style>
</head>
<body>

<div class="container admin-home-container">
    <h2 class="text-center mb-5">Welcome, Admin</h2>

    <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-success admin-btn mb-4">
        Pending Registered Organization Approval Request
    </a>

    <a href="${pageContext.request.contextPath}/hosting-requestdashboard" class="btn btn-success admin-btn">
        Pending Hosting Request
    </a>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
