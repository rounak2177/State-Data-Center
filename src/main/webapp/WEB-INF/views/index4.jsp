<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Data Center Management System</title>
  <meta name="description" content="A centralized platform for managing departmental data for the Government of West Bengal.">
  <meta name="keywords" content="Data Center, Government Portal, West Bengal, E-Governance">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Poppins&family=Nunito+Sans&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">

  <!-- Include header -->
  <jsp:include page="/WEB-INF/jsp/includes/header.jsp" />

  <main class="main">
    <!-- Keep all your sections (hero, about, services, FAQ, contact, etc.) unchanged here -->
    
        <!-- Hero Section -->
    <section id="hero" class="hero section">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-7 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h1>Empowering State Data Infrastructure</h1>
            <p>A unified platform for managing government departmental data across West Bengal.</p>
            <div class="d-flex">
              <a href="#about" class="btn-get-started">Get Started</a>
              <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Overview</span></a>
            </div>
          </div>
          <div class="col-lg-5 order-1 order-lg-2 hero-img">
            <img src="assets/img/hero-img.png" class="img-fluid" alt="Data Center Banner">
          </div>
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about section">
      <div class="container" data-aos="fade-up">
        <div class="row gx-0">
          <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="assets/img/about.jpg" class="img-fluid" alt="About">
          </div>
          <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
            <div class="content">
              <h3>About the Project</h3>
              <h2>A strategic initiative to streamline digital operations across state departments.</h2>
              <p>
                The Data Center Management System enables seamless data entry, monitoring, and reporting for all administrative entities under the Government of West Bengal.
              </p>
              <div class="text-center text-lg-start">
                <a href="#" class="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                  <span>Read More</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services section">
      <div class="container section-title" data-aos="fade-up">
        <h2>Our Services</h2>
        <p>Comprehensive tools to support administrative data operations and service transparency.</p>
      </div>
      <div class="container">
        <div class="row gy-4">

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-database"></i></div>
              <h4><a href="#" class="stretched-link">Data Collection</a></h4>
              <p>Structured data entry forms for districts, departments, and administrative entities.</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-bar-chart-line"></i></div>
              <h4><a href="#" class="stretched-link">Reporting Dashboard</a></h4>
              <p>Generate insights, usage statistics, and departmental summaries in real-time.</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="300">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-shield-lock"></i></div>
              <h4><a href="#" class="stretched-link">Secure Access</a></h4>
              <p>Role-based access for government officials to ensure data integrity and security.</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="400">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-cloud-upload"></i></div>
              <h4><a href="#" class="stretched-link">Cloud Sync</a></h4>
              <p>All registered entries are stored safely and synchronized with the state cloud.</p>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">
      <div class="container section-title" data-aos="fade-up">
        <h2>Snapshots</h2>
        <p>Visuals from training, data entry, and dashboard modules across state departments.</p>
      </div>

      <div class="container">
        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">Dashboards</li>
          </ul>

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

            <!-- Example portfolio item (you can replace images later) -->
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/app-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Dashboard View</h4>
                  <p>Real-time overview of entries</p>
                  <a href="assets/img/portfolio/app-1.jpg" class="glightbox preview-link" title="Dashboard View"><i class="bi bi-zoom-in"></i></a>
                  <a href="#" class="details-link" title="More Details"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div>

            <!-- Add more items as needed -->

          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- Scripts -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/js/main.js"></script>
  
  <!-- Section Title -->
<div class="container section-title" data-aos="fade-up">
  <h2>Frequently Asked Questions</h2>
  <p>Common questions about how our Data Center Management System operates and supports users.</p>
</div><!-- End Section Title -->

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="faq-container">

        <div class="faq-item faq-active" data-aos="fade-up" data-aos-delay="200">
          <i class="faq-icon bi bi-question-circle"></i>
          <h3>What is the purpose of the Data Center Management System?</h3>
          <div class="faq-content">
            <p>It provides a centralized platform for registering entities, tracking complaints, managing IT assets, and ensuring secure operations within data centers.</p>
          </div>
          <i class="faq-toggle bi bi-chevron-right"></i>
        </div><!-- End Faq item-->

        <div class="faq-item" data-aos="fade-up" data-aos-delay="300">
          <i class="faq-icon bi bi-question-circle"></i>
          <h3>Who can register in the system?</h3>
          <div class="faq-content">
            <p>Authorized personnel from government departments, administrative units, and IT support teams can register and access functionalities based on roles.</p>
          </div>
          <i class="faq-toggle bi bi-chevron-right"></i>
        </div><!-- End Faq item-->

        <div class="faq-item" data-aos="fade-up" data-aos-delay="400">
          <i class="faq-icon bi bi-question-circle"></i>
          <h3>How are service requests or complaints handled?</h3>
          <div class="faq-content">
            <p>Users can log complaints through the portal, which are routed to relevant teams for quick resolution. Status updates and logs are available in real-time.</p>
          </div>
          <i class="faq-toggle bi bi-chevron-right"></i>
        </div><!-- End Faq item-->

        <div class="faq-item" data-aos="fade-up" data-aos-delay="500">
          <i class="faq-icon bi bi-question-circle"></i>
          <h3>Is the data stored in the system secure?</h3>
          <div class="faq-content">
            <p>Yes, the platform is built with robust authentication and role-based access control to ensure data integrity and security within the center's infrastructure.</p>
          </div>
          <i class="faq-toggle bi bi-chevron-right"></i>
        </div><!-- End Faq item-->

        <div class="faq-item" data-aos="fade-up" data-aos-delay="600">
          <i class="faq-icon bi bi-question-circle"></i>
          <h3>What are the system’s operational hours?</h3>
          <div class="faq-content">
            <p>The system is accessible 24/7. Support staff are available from Monday to Friday, 9:00AM to 5:00PM, for resolving technical or account-related issues.</p>
          </div>
          <i class="faq-toggle bi bi-chevron-right"></i>
        </div><!-- End Faq item-->

      </div>
    </div>
  </div>
</div>
  
  
  <!-- Section Title -->
<div class="container section-title" data-aos="fade-up">
  <h2>Contact</h2>
  <p>Reach out to our Data Center Management Team for assistance or support.</p>
</div><!-- End Section Title -->

<div class="container" data-aos="fade-up" data-aos-delay="100">
  <div class="row gy-4">

    <div class="col-lg-6">
      <div class="row gy-4">
        <div class="col-md-6">
          <div class="info-item" data-aos="fade" data-aos-delay="200">
            <i class="bi bi-geo-alt"></i>
            <h3>Address</h3>
            <p>Data Center HQ, Sector V</p>
            <p>Kolkata, WB 700091</p>
          </div>
        </div><!-- End Info Item -->

        <div class="col-md-6">
          <div class="info-item" data-aos="fade" data-aos-delay="300">
            <i class="bi bi-telephone"></i>
            <h3>Call Us</h3>
            <p>+91 98765 43210</p>
            <p>+91 98300 11223</p>
          </div>
        </div><!-- End Info Item -->

        <div class="col-md-6">
          <div class="info-item" data-aos="fade" data-aos-delay="400">
            <i class="bi bi-envelope"></i>
            <h3>Email Us</h3>
            <p>support@datacenter.gov.in</p>
            <p>admin@datacenter.gov.in</p>
          </div>
        </div><!-- End Info Item -->

        <div class="col-md-6">
          <div class="info-item" data-aos="fade" data-aos-delay="500">
            <i class="bi bi-clock"></i>
            <h3>Open Hours</h3>
            <p>Monday - Friday</p>
            <p>9:00AM - 05:00PM</p>
          </div>
        </div><!-- End Info Item -->

      </div>
    </div>

    <div class="col-lg-6">
      <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
        <div class="row gy-4">
          <div class="col-md-6">
            <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
          </div>
          <div class="col-md-6 ">
            <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
          </div>
          <div class="col-12">
            <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
          </div>
          <div class="col-12">
            <textarea class="form-control" name="message" rows="6" placeholder="Message" required=""></textarea>
          </div>
          <div class="col-12 text-center">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>
            <button type="submit">Send Message</button>
          </div>
        </div>
      </form>
    </div><!-- End Contact Form -->

  </div>
</div>


  </main>

  <!-- Include footer -->
  <jsp:include page="/WEB-INF/jsp/includes/footer.jsp" />

  <!-- Scripts -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/js/main.js"></script>

</body>
</html>