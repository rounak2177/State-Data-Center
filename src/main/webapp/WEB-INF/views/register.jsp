<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Your Organisation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        .form-section { margin-top: 20px; }
        .required::after { content:" *"; color:red; }
        .register-container {
            margin-top: 140px; /* Push content below header */
            padding-bottom: 80px; /* Prevent footer overlap */
        }
        .btn-register {
            background-color: #00796B;
            color: white;
            border: none;
        }
        .btn-register:hover {
            background-color: #00665B;
            color: white;
        }
    </style>
</head>
<body>
<div class="container register-container">
    <h3 class="mt-4" style="color:#00796B;">Register your organisation</h3>
    <p class="text-primary">
        You can register your organisation ONLY if you have Office ID with a valid Government Email address.<br/>
        If you don't have valid eOffice ID / Government Email address, then please contact your Head of Organisation.<br/>
        Authorisation letter issued by the head of the organisation is required for registration.
    </p>

    <!-- Setup lists for departments, districts, and types -->
    <c:set var="departments" value="Agriculture,Agriculture Marketing,Animal Resources Development,Backward Classes Welfare,Chief Minister's Office,Consumer Affairs,Co-operation,Correctional Administration,Disaster Management and Civil Defence,Environment,Finance,Fire and Emergency Services,Fisheries,Food and Supplies,Food Processing Industries and Horticulture,Forest,Health and Family Welfare,Higher Education,Housing,Home and Hill Affairs,Industry Commerce and Enterprises,Information and Cultural Affairs,Information Technology and Electronics,Irrigation and Waterways,Judicial,Labour,Land and Land Reforms Refugee Relief and Rehabilitation,Law,Mass Education Extension and Library Service,Micro Small and Medium Enterprise and Textile,Minorities Affairs and Madrasah Education,Non-Conventional and Renewable Energy Sources,North Bengal Development,Panchayat and Rural Development,Parliamentary Affairs,Paschimanchal Unnayan Affairs,Personnel and Administrative Reforms and e-Governance,Planning, Statistics and Programme Monitoring,Power,Public Enterprises and Industrial Reconstruction,Public Health Engineering,Public Works,School Education,Science and Tecnology and Biotechnology,Self Help Group and Self Employment,Sundarban Affairs,Technical Education, Training and Skill Development,Tourism,Transport,Tribal Development,Urban Development and Municipal Affairs,Water resources Investigation and Development,Women and Child Development and Social Welfare,Youth Services and Sports,West Bengal Legislative Assembly Secretariat"/>
    <c:set var="districts" value="Alipurduar,Bankura,Birbhum,Cooch Behar,Dakshin Dinajpur,Darjeeling,Hooghly,Howrah,Jalpaiguri,Jhargram,Kalimpong,Kolkata,Malda,Murshidabad,Nadia,North 24 Parganas,Paschim Bardhaman,Paschim Medinipur,Purba Bardhaman,Purba Medinipur,Purulia,South 24 Parganas,Uttar Dinajpur"/>
    <c:set var="entityTypes" value="Department,Directorate,Commisionarate,Police Commissionerate,Police District,Municipal Corporation,Development Corporation,Development Authority,Urban Local Body,Others"/>

    <!-- Add multipart/form-data for file upload -->
    <form action="${pageContext.request.contextPath}/signup" method="post" enctype="multipart/form-data">

        <!-- Category -->
        <div class="form-group">
            <label class="required">Select Category:</label><br/>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="category" value="State Government" checked>
                <label class="form-check-label">State Government</label>
            </div>
        </div>

        <!-- Admin Type -->
        <div class="form-group">
            <label class="required">Select Type:</label><br/>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="adminType" value="Secretariat" checked onclick="toggleDistrict(false)">
                <label class="form-check-label">Secretariat</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="adminType" value="District Administration" onclick="toggleDistrict(true)">
                <label class="form-check-label">District Administration</label>
            </div>
        </div>

        <!-- State -->
        <div class="form-group">
            <label class="required">Name of the State:</label>
            <input type="text" class="form-control" name="state" value="West Bengal" readonly/>
        </div>

        <!-- Department Dropdown -->
        <div class="form-group" id="deptDiv">
            <label class="required">Name of the Department:</label>
            <select class="form-control" name="departments">
                <option value="">Select Department</option>
                <c:forTokens var="dept" items="${departments}" delims=",">
                    <option value="${dept}">${dept}</option>
                </c:forTokens>
            </select>
        </div>

        <!-- District Dropdown -->
        <div class="form-group d-none" id="districtDiv">
            <label class="required">Name of the District:</label>
            <select class="form-control" name="districts">
                <option value="">Select District</option>
                <c:forTokens var="dist" items="${districts}" delims=",">
                    <option value="${dist}">${dist}</option>
                </c:forTokens>
            </select>
        </div>

        <!-- Entity Type -->
        <div class="form-group">
            <label class="required">Organisation / Entity Type:</label>
            <select class="form-control" id="entityTypes" onchange="autofillEntityName()" name="entityTypes">
                <option value="">-- Select --</option>
                <c:forTokens var="type" items="${entityTypes}" delims=",">
                    <option value="${type}">${type}</option>
                </c:forTokens>
            </select>
        </div>

        <!-- Entity Name -->
        <div class="form-group">
            <label class="required">Organisation / Entity Name:</label>
            <input type="text" class="form-control" id="entityName" name="entityName"/>
        </div>

        <!-- Organisation Portal Link -->
        <div class="form-group">
            <label>Organisation Web Portal Link:</label>
            <input type="url" class="form-control" name="website" placeholder="https://yourportal.gov.in"/>
        </div>

        <!-- Organisation Address -->
        <div class="form-group">
            <label class="required">Organisation Address:</label>
            <textarea class="form-control" name="address" rows="3" placeholder="Enter full postal address"></textarea>
        </div>

        <!-- Officer -->
        <div class="form-group">
            <label class="required">Nodal Officer / Authorised Person's Name:</label>
            <input type="text" class="form-control" name="officerName"/>
        </div>

        <!-- Mobile -->
        <div class="form-group">
            <label class="required">Authorised Person's Mobile:</label>
            <input type="text" class="form-control" name="mobile"/>
        </div>

        <!-- Designation -->
        <div class="form-group">
            <label class="required">Authorised Person's Designation:</label>
            <input type="text" class="form-control" name="designation"/>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label class="required">Authorised Person's Email:</label>
            <input type="email" class="form-control" name="email"/>
            <small class="form-text text-muted">(Used for login using OTP)</small>
        </div>

        <!-- Upload Letter of Authority -->
        <div class="form-group">
            <label class="required">Upload Letter of Authority (PDF only):</label>
            <input type="file" class="form-control-file" name="authorityLetter" accept=".pdf" required/>
        </div>

        <button type="submit" class="btn btn-register">Register</button>
    </form>
</div>

<!-- JavaScript -->
<script>
    function toggleDistrict(showDistrict) {
        document.getElementById('deptDiv').classList.toggle('d-none', showDistrict);
        document.getElementById('districtDiv').classList.toggle('d-none', !showDistrict);
    }

    function autofillEntityName() {
        const type = document.getElementById("entityTypes").value;
        const nameInput = document.getElementById("entityName");

        if (type === "Others" || type === "") {
            nameInput.value = "";
            nameInput.readOnly = false;
        } else {
            nameInput.value = type;
            nameInput.readOnly = true;
        }
    }
</script>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
