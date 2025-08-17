<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<div class="container mt-5 pt-4">
    <h2 class="text-primary mb-4">Admin Dashboard - Hosting Requests</h2>

    <!-- Flash Message -->
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center fw-bold">${success}</div>
    </c:if>

    <div class="table-responsive">
        <form method="post" action="/update-hosting-approvals">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Application</th>
                        <th>Domain</th>
                        <th>VM Count</th>
                        <th>CPU (Cores)</th>
                        <th>RAM(in GB)</th>
                        <th>Disk(in GB)</th>
                        <th>OS</th>
                        <th>Database</th>
                        <th>VM Type</th>
                        <th>User Email</th>
                        <th>Current Status</th>
                        <th>Approval Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hosting_requests" items="${hostingRequests}">
                        <tr>
                            <td>${hosting_requests.id}</td>
                            <td>${hosting_requests.applicationName}</td>
                            <td>${hosting_requests.domainName}</td>
                            <td>${hosting_requests.vmCount}</td>
                            <td>${hosting_requests.cpu}</td>
                            <td>${hosting_requests.ram}</td>
                            <td>${hosting_requests.disk}</td>
                            <td>${hosting_requests.os}</td>
                            <td>${hosting_requests.database}</td>
                            <td>${hosting_requests.vmType}</td>
                            <td>${hosting_requests.userEmail}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${hosting_requests.status eq 'APPROVED'}">bg-success</c:when>
                                        <c:when test="${hosting_requests.status eq 'REJECTED'}">bg-danger</c:when>
                                        <c:otherwise>bg-warning</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${empty hosting_requests.status}">PENDING</c:when>
                                        <c:otherwise>${hosting_requests.status}</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                            <td>
                                <select name="hostingStatus[${hosting_requests.id}]" class="form-select">
                                    <option value="PENDING" <c:if test="${empty hosting_requests.status or hosting_requests.status eq 'PENDING'}">selected</c:if>>Pending</option>
                                    <option value="APPROVED" <c:if test="${hosting_requests.status eq 'APPROVED'}">selected</c:if>>Approve</option>
                                    <option value="REJECTED" <c:if test="${hosting_requests.status eq 'REJECTED'}">selected</c:if>>Reject</option>
                                </select>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <button type="submit" class="btn btn-primary btn-lg">Update Hosting Approvals</button>
            </div>
        </form>
        
<!-- Pagination Controls -->
<nav aria-label="Page navigation">
    <ul class="pagination justify-content-center mt-4">
        
        <!-- Previous button -->
        <c:if test="${currentPage > 0}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}">Previous</a>
            </li>
        </c:if>

        <!-- Page numbers -->
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <li class="page-item ${i == currentPage ? 'active' : ''}">
                <a class="page-link" href="?page=${i}&size=${pageSize}">${i + 1}</a>
            </li>
        </c:forEach>

        <!-- Next button -->
        <c:if test="${currentPage < totalPages - 1}">
            <li class="page-item">
                <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}">Next</a>
            </li>
        </c:if>

    </ul>
</nav>

    </div>
</div>

<%@ include file="includes/footer.jsp" %>
