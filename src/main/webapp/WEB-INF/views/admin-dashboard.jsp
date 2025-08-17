<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<style>
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        flex-direction: column;
    }
    main {
        flex: 1;
    }
    footer {
        margin-top: auto;
    }
    table.table {
        font-size: 13px;
        table-layout: auto;
        width: 100%;
    }
    table.table th, table.table td {
        white-space: nowrap;
        padding: 6px 8px;
    }
</style>

<main class="container mt-5 pt-4">
    <h2 class="text-primary mb-4">Admin Dashboard - Registered Organizations</h2>

    <c:if test="${not empty success}">
        <div class="alert alert-success text-center fw-bold">${success}</div>
    </c:if>

    <div class="table-responsive">
        <form method="post" action="/update-approvals">
            <table class="table table-bordered table-hover table-sm">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Officer Name</th>
                        <th>Mobile</th>
                        <th>Designation</th>
                        <th>Email</th>
                        <th>Current Status</th>
                        <th>Approval Status</th>
                        <th>Details</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.officerName}</td>
                            <td>${user.mobile}</td>
                            <td>${user.designation}</td>
                            <td>${user.email}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${user.status eq 'Approved'}">bg-success</c:when>
                                        <c:when test="${user.status eq 'Rejected'}">bg-danger</c:when>
                                        <c:otherwise>bg-warning</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${empty user.status}">Pending</c:when>
                                        <c:otherwise>${user.status}</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                            <td>
                                <select name="status[${user.id}]" class="form-select">
                                    <option value="Pending" <c:if test="${empty user.status or user.status eq 'Pending'}">selected</c:if>>Pending</option>
                                    <option value="Approved" <c:if test="${user.status eq 'Approved'}">selected</c:if>>Approve</option>
                                    <option value="Rejected" <c:if test="${user.status eq 'Rejected'}">selected</c:if>>Reject</option>
                                </select>
                            </td>
                            <td>
                                <a href="/user-details/${user.id}" class="btn btn-sm btn-info">Read More</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <button type="submit" class="btn btn-primary btn-lg">Update Approvals</button>
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
</main>

<%@ include file="includes/footer.jsp" %>
