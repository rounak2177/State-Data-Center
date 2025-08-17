<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>State Data Management System</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Poppins&family=Nunito+Sans&display=swap" rel="stylesheet">

  <!-- Vendor CSS -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">

<!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center sticky-top">
  <div class="container position-relative d-flex align-items-center">

    <a href="/" class="logo d-flex align-items-center me-auto">
      <h1 class="sitename">State Data Centre</h1>
    </a>

    <nav id="navmenu" class="navmenu">
      <ul>
        <li><a href="/" class="active">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#portfolio">Modules</a></li>
        <li><a href="/register">Register</a></li>
        <li><a href="/login">Login</a></li>
      </ul>
      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
    </nav>
  </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="hero section">
  <div class="container">
    <div class="row gy-4">
      <div class="col-lg-7 d-flex flex-column justify-content-center">
        <h1>Welcome to the State Data Management System</h1>
        <p>Empowering Government Departments through Centralized Digital Registration & Management.</p>
        <div class="d-flex">
          <a href="/register" class="btn-get-started">Register Now</a>
          <a href="/login" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Login</span></a>
        </div>
      </div>
      <div class="col-lg-5 hero-img text-center">
        <img src="assets/img/hero-img.png" class="img-fluid" alt="">
      </div>
    </div>
  </div>
</section><!-- End Hero -->

<!-- ======= About Section ======= -->
<section id="about" class="about section">
  <div class="container" data-aos="fade-up">
    <div class="row gx-0">
      <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
        <img src="assets/img/about.jpg" class="img-fluid" alt="">
      </div>
      <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
        <div class="content">
          <h3>About the System</h3>
          <h2>A single-window platform for registration & management of organizations under Govt. of West Bengal.</h2>
          <p>This platform ensures secure, transparent, and efficient data handling and role-based access to maintain accountability.</p>
          <div class="text-center text-lg-start">
            <a href="#services" class="btn-read-more d-inline-flex align-items-center justify-content-center">
              <span>Explore Features</span>
              <i class="bi bi-arrow-right"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section><!-- End About -->

<!-- ======= Features Section ======= -->
<section id="features" class="features section">
  <div class="container">
    <ul class="nav nav-tabs row g-2 d-flex" data-aos="fade-up" data-aos-delay="100">
      <li class="nav-item col-3"><a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#features-tab-1"><h4>Smart Forms</h4></a></li>
      <li class="nav-item col-3"><a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-2"><h4>Secure Access</h4></a></li>
      <li class="nav-item col-3"><a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-3"><h4>Admin Tools</h4></a></li>
      <li class="nav-item col-3"><a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-4"><h4>Analytics</h4></a></li>
    </ul>
    <div class="tab-content" data-aos="fade-up" data-aos-delay="200">
      <div class="tab-pane fade active show" id="features-tab-1">
        <div class="row">
          <div class="col-lg-6">
            <h3>Smart Registration Flow</h3>
            <ul>
              <li><i class="bi bi-check2-all"></i> Dynamic forms for State & District level entities</li>
              <li><i class="bi bi-check2-all"></i> Category & Department filtering</li>
              <li><i class="bi bi-check2-all"></i> Conditional fields based on admin type</li>
            </ul>
          </div>
          <div class="col-lg-6 text-center">
            <img src="assets/img/working-1.jpg" alt="" class="img-fluid">
          </div>
        </div>
      </div>
      <!-- Repeat tabs 2-4 with your own wording if needed -->
    </div>
  </div>
</section><!-- End Features -->

<!-- ======= Services Section ======= -->
<section id="services" class="services section">
  <div class="container section-title" data-aos="fade-up">
    <h2>System Services</h2>
    <p>Explore the core services of the State Data Management System that support governance, transparency, and efficiency.</p>
  </div>
  <div class="container">
    <div class="row gy-4">
      <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="100">
        <div class="service-item position-relative">
          <div class="icon"><i class="bi bi-journal-check icon"></i></div>
          <h4><a href="#" class="stretched-link">Dynamic Registration</a></h4>
          <p>Flexible forms for onboarding government departments and agencies.</p>
        </div>
      </div>
      <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="200">
        <div class="service-item position-relative">
          <div class="icon"><i class="bi bi-person-check icon"></i></div>
          <h4><a href="#" class="stretched-link">User Verification</a></h4>
          <p>Email + CAPTCHA login ensures secure access to the system.</p>
        </div>
      </div>
      <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="300">
        <div class="service-item position-relative">
          <div class="icon"><i class="bi bi-speedometer2 icon"></i></div>
          <h4><a href="#" class="stretched-link">Admin Dashboard</a></h4>
          <p>Monitor registered users and manage system settings centrally.</p>
        </div>
      </div>
      <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="400">
        <div class="service-item position-relative">
          <div class="icon"><i class="bi bi-shield-lock icon"></i></div>
          <h4><a href="#" class="stretched-link">Access Control</a></h4>
          <p>Ensure only verified departments and officers have access rights.</p>
        </div>
      </div>
    </div>
  </div>
</section><!-- End Services -->

<!-- ======= Portfolio Section ======= -->
<section id="portfolio" class="portfolio section">
  <div class="container section-title" data-aos="fade-up">
    <h2>Modules Showcase</h2>
    <p>Core modules of the system for seamless data and entity management</p>
  </div>
  <div class="container">
    <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
      <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
        <li data-filter="*" class="filter-active">All</li>
        <li data-filter=".filter-app">Registration</li>
        <li data-filter=".filter-product">Dashboard</li>
        <li data-filter=".filter-branding">Security</li>
      </ul>
      <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
        <!-- Portfolio Item 1 -->
        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
          <div class="portfolio-content h-100">
            <img src="assets/img/portfolio/app-1.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Registration Module</h4>
              <p>Handles user onboarding and field validations.</p>
              <a href="assets/img/portfolio/app-1.jpg" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              <a href="#" class="details-link"><i class="bi bi-link-45deg"></i></a>
            </div>
          </div>
        </div>
        <!-- Portfolio Item 2 -->
        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
          <div class="portfolio-content h-100">
            <img src="assets/img/portfolio/product-1.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Dashboard Module</h4>
              <p>Admin panel for tracking and control of registrations.</p>
              <a href="assets/img/portfolio/product-1.jpg" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              <a href="#" class="details-link"><i class="bi bi-link-45deg"></i></a>
            </div>
          </div>
        </div>
        <!-- Portfolio Item 3 -->
        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
          <div class="portfolio-content h-100">
            <img src="assets/img/portfolio/branding-1.jpg" class="img-fluid" alt="">
            <div class="portfolio-info">
              <h4>Login Security</h4>
              <p>Includes CAPTCHA and role-based login validation.</p>
              <a href="assets/img/portfolio/branding-1.jpg" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              <a href="#" class="details-link"><i class="bi bi-link-45deg"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section><!-- End Portfolio -->

<!-- Vendor JS Files -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Main JS File -->
<script src="assets/js/main.js"></script>
</body>
</html>
