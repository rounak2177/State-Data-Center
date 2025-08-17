<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<html>
<head>
    <title>Pay Hosting Fee</title>
    <link rel="stylesheet" href="/css/main.css" />
</head>
<body>
<div class="container">
    <h2>Pay Hosting Fee</h2>

    <p><strong>Application Name:</strong> ${hostingRequest.applicationName}</p>
    <p><strong>Domain Name:</strong> ${hostingRequest.domainName}</p>
    <p><strong>VM Count:</strong> ${hostingRequest.vmCount}</p>
    <p><strong>CPU:</strong> ${hostingRequest.cpu}</p>
    <p><strong>RAM:</strong> ${hostingRequest.ram}</p>
    <p><strong>Disk:</strong> ${hostingRequest.disk}</p>
    <p><strong>OS:</strong> ${hostingRequest.os}</p>
    <p><strong>Database:</strong> ${hostingRequest.database}</p>
    <p><strong>VM Type:</strong> ${hostingRequest.vmType}</p>

    <hr>
    <h4>Total Hosting Fee: ₹${totalFee}</h4>

    <form method="post" action="/submit-fee/${hostingRequest.id}">
        <button type="submit" class="btn btn-success">Pay Fee</button>
    </form>
</div>
</body>
</html>

<%@ include file="includes/footer.jsp" %>
