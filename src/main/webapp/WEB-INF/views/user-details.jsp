<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Organization Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        h3 {
            font-weight: bold;
            color: #00796b; /* Updated to teal green */
        }
        table th {
            width: 30%;
            background-color: #f1f1f1;
            font-weight: 500;
        }
        table td {
            width: 70%;
        }
        .btn-teal {
            background-color: #00796b;
            border-color: #00796b;
            color: white;
        }
        .btn-teal:hover {
            background-color: #00695c;
            border-color: #00695c;
        }
    </style>
</head>
<body>

<div class="container mt-5 pt-4 mb-5">
    <h3 class="mb-4">Organization Registration Details</h3>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-bordered">
            <tbody>
                <tr><th>ID</th><td>${user.id}</td></tr>
                <tr><th>Category</th><td>${user.category}</td></tr>
                <tr><th>Admin Type</th><td>${user.adminType}</td></tr>
                <tr><th>State</th><td>${user.state}</td></tr>
                <tr><th>Department</th><td>${user.departments}</td></tr>
                <tr><th>District</th><td>${user.districts}</td></tr>
                <tr><th>Entity Type</th><td>${user.entityTypes}</td></tr>
                <tr><th>Entity Name</th><td>${user.entityName}</td></tr>
                <tr><th>Website</th>
                    <td>
                        <c:if test="${not empty user.website}">
                            <a href="${user.website}" target="_blank">${user.website}</a>
                        </c:if>
                        <c:if test="${empty user.website}">
                            N/A
                        </c:if>
                    </td>
                </tr>
                <tr><th>Address</th><td>${user.address}</td></tr>
                <tr><th>Officer Name</th><td>${user.officerName}</td></tr>
                <tr><th>Mobile</th><td>${user.mobile}</td></tr>
                <tr><th>Designation</th><td>${user.designation}</td></tr>
                <tr><th>Email</th><td>${user.email}</td></tr>
                <tr><th>Role</th><td>${user.role}</td></tr>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-teal mt-3">Back to Dashboard</a>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
