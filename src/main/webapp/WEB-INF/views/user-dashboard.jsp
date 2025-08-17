<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<div class="container mt-5 pt-4">
    <h2 class="text-center text-primary">User Dashboard</h2>

    <!-- Hosting Request Form -->
    <div class="card mt-4 mb-5 shadow">
        <div class="card-header bg-secondary text-white">Submit Hosting Request</div>
        <div class="card-body">
            <form method="post" action="/hosting-request">

                <div class="mb-3">
                    <label class="form-label">Application Name</label>
                    <input type="text" name="applicationName" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Domain Name</label>
                    <input type="text" name="domainName" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Number of VMs</label>
                    <input type="number" id="vmCount" name="vmCount" class="form-control" min="1" required />
                </div>

                <!-- Dynamic VM specs will be inserted here -->
                <div id="vmDetailsContainer"></div>

                <button type="submit" class="btn btn-primary">Submit Request</button>
            </form>
        </div>
    </div>

    <!-- Hosting Requests Table -->
    <div class="table-responsive">
        <h4 class="text-secondary">My Hosting Requests</h4>
        <c:if test="${not empty userRequests}">
            <table class="table table-bordered table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Application</th>
                        <th>Domain</th>
                        <th>VM Count</th>
                        <th>VM Details</th>
                        <th>User Email</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="req" items="${userRequests}">
                        <tr>
                            <td>${req.applicationName}</td>
                            <td>${req.domainName}</td>
                            <td>${req.vmCount}</td>
                            <td>
                                <table class="table table-sm table-bordered mb-0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>CPU</th>
                                            <th>RAM</th>
                                            <th>Disk</th>
                                            <th>OS</th>
                                            <th>Database</th>
                                            <th>Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="vm" items="${req.vmList}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${vm.cpu}</td>
                                                <td>${vm.ram}</td>
                                                <td>${vm.disk}</td>
                                                <td>${vm.os}</td>
                                                <td>${vm.database}</td>
                                                <td>${vm.vmType}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                            <td>${req.userEmail}</td>
                            <td>
                                <span class="badge 
                                    ${req.status == 'APPROVED' ? 'bg-success' : 
                                     req.status == 'REJECTED' ? 'bg-danger' : 'bg-warning'}">
                                    ${req.status}
                                </span>
                            </td>
                            <td>
                                <!-- Total Fee and Payment Button -->
                                <c:if test="${req.status == 'APPROVED'}">
                                    <div>Total Fee: ₹${req.totalFee}</div>
                                    <c:choose>
                                        <c:when test="${req.feePaid == 'Paid'}">
                                            <span class="badge bg-success">Paid</span>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="/submit-fee/${req.id}" method="post" style="display: inline;">
                                                <button type="submit" class="btn btn-primary btn-sm">Pay Now</button>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty userRequests}">
            <div class="alert alert-info mt-3">No hosting requests submitted yet.</div>
        </c:if>
    </div>
</div>

<script>
document.getElementById('vmCount').addEventListener('input', function () {
    const count = parseInt(this.value) || 0;
    const container = document.getElementById('vmDetailsContainer');
    container.innerHTML = '';

    for (let i = 0; i < count; i++) {
        container.innerHTML += `
            <div class="card mt-3">
                <div class="card-header bg-info text-white">VM ${i + 1} Specifications</div>
                <div class="card-body">
                    <div class="mb-3">
                        <label>CPU (Cores)</label>
                        <select name="cpu" class="form-control" required>
                            <option value="">-- Select CPU Cores --</option>
                            <option>2</option>
                            <option>4</option>
                            <option>6</option>
                            <option>8</option>
                            <option>16</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>RAM</label>
                        <select name="ram" class="form-control" required>
                            <option value="">-- Select RAM --</option>
                            <option>4GB</option>
                            <option>8GB</option>
                            <option>16GB</option>
                            <option>32GB</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Disk</label>
                        <select name="disk" class="form-control" required>
                            <option value="">-- Select Disk Size --</option>
                            <option>128GB</option>
                            <option>256GB</option>
                            <option>512GB</option>
                            <option>1TB</option>
                            <option>2TB</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Operating System</label>
                        <input type="text" name="os" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label>Database/Application</label>
                        <input type="text" name="database" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label>Type of VM</label>
                        <select name="vmType" class="form-control" required>
                            <option value="">-- Select --</option>
                            <option value="Application">Application</option>
                            <option value="Data">Data</option>
                            <option value="File">File</option>
                        </select>
                    </div>
                </div>
            </div>
        `;
    }
});
</script>

<%@ include file="includes/footer.jsp" %>

