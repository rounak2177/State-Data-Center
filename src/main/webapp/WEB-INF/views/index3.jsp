<%@ page contentType="text/html;charset=UTF-8" %>
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

  <header id="header" class="header d-flex align-items-center sticky-top" style="background-color: #f5faff;">
  <div class="container position-relative d-flex justify-content-between align-items-center">

    <!-- Left Side: Text block -->
    <div class="d-flex flex-column">
      <h2 class="sitename mb-1" style="font-size: 26px;">Data Center Management</h2>
      <h4 style="font-size: 16px; font-weight: normal; margin: 0;">Department of West Bengal Electronics Industry Development Corporation Limited</h4>
    </div>
  </div>

  <!-- Navigation -->
  <div class="container position-relative d-flex align-items-center mt-3">
    <nav id="navmenu" class="navmenu me-auto">
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
    
</header>

  <main class="main">

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
        <p>The WBSDC is the key-supporting element of e-Government Initiatives & businesses for delivering services to the citizens with greater reliability, availability and service-ability of the Government Departments. SDC facilitates consolidation of services, applications and infrastructure. SDC provides many functionalities and some of the key functionalities are:</p>
      </div>
      <div class="container">
        <div class="row gy-4">

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-database"></i></div>
              <h4><a href="#" class="stretched-link">Domain Registration</a></h4>
              <p>(only *.wb.gov.in)</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-bar-chart-line"></i></div>
              <h4><a href="#" class="stretched-link">Secure Data Storage</a></h4>
              <p>Secure data storage protects sensitive information through encryption and access control to ensure confidentiality and integrity.</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="300">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-shield-lock"></i></div>
              <h4><a href="#" class="stretched-link">Remote Management - New Cloud</a></h4>
              <p>Remote management through new cloud solutions enables seamless access, monitoring, and control of systems from anywhere in real-time.</p>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="400">
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-cloud-upload"></i></div>
              <h4><a href="#" class="stretched-link">Online Delivery of Service</a></h4>
              <p>Online delivery of services ensures fast, convenient, and contactless access to government and organizational resources anytime, anywhere.</p>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">
      <div class="container section-title" data-aos="fade-up">
        <h2>About Us</h2>
        <p>West Bengal State Data Center (WBSDC) has been developed by the State of West Bengal, which is envisioned as the "Shared, reliable and secure infrastructure services centre for hosting and managing the e-Governance Applications" and the same has been developed as a part of Mission Mode Project under National e-Governance Plan (NeGP) (presently known as Digital India) and to ensure adherence to common principles and policies towards realization of the vision. The WBSDC is situated at a prime location within Kolkata and it is being continuously revamped with new technologies and upgraded Network and Security devices.
WBSDC facilitates consolidation of services, applications and infrastructure. SDC provides numerous functionalities such as having Central data repository, Secured Data Storage, Online Delivery of Services, Citizen Information/Services Portal, State Intranet Portal, Remote Management and Service Integration, among others. As one of the pivotal constituents of National e-Governance Plan (NeGP), a series of various Government Departments applications are being hosted at SDC.</p>
      </div>

      <div class="container">
        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">Non-IT Infrastructure</li>
            <li data-filter=".filter-product">IT Infrastructure</li>
            <li data-filter=".filter-branding">Security</li>
            <li data-filter=".filter-books">Storage</li>
            <li data-filter=".filter-books">Service-Level Features</li>
          </ul>

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

            <!-- Example portfolio item (you can replace images later) -->
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/app-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Non-IT Infrastructure</h4>
                  <p>old Aisle Containment

Monitoring at Rack Level Temperature and Humidity

Active Tiles for High Density Racks

PAC connected through ATS (Automatic Transfer Switch)

UPS Power for RACKS connected with different source and different path (dual path)

DC Infrastructure Management for optimization in cooling, power and IT infra utilization

Non-IT passive components monitored from IBMS

Implementation of Access Control and Visitor Management Software</p>
                  <a href="assets/img/portfolio/app-1.jpg" class="glightbox preview-link" title="Dashboard View"><i class="bi bi-zoom-in"></i></a>
                  <a href="#" class="details-link" title="More Details"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div>

            <!-- Add more items as needed -->
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/product-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>IT Infrastructure</h4>
                  <p>Migration to Blade Server from traditional Rack Server

Latest Private Cloud Solution with RHOSP 13 and RHV 4.2

Blade Fabric Interconnectivity with 40 Gbps speed

Multi-Tenancy at host level

Network Leaf Spine Architecture with High End Nexus switches with 10 Gbps speed

IPv6 enabled Data Centre

Enhancement Internet bandwidth of 10 GBPS

Maintaining 3:1 ratio for upload vs download speed

Using VPC (Virtual Port Channel) for active-active back bone

Compute Capacity of 1000 VM</p>
                  <a href="assets/img/portfolio/product-1.jpg" title="Product 1" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                  <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/branding-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Security</h4>
                  <p>Separate IPS facility and malware protection for MZ and DMZ

Separate Virtual Load Balancer for critical application

Deployment of SSL certificate through WAF for all hosted applications

Deployment of LLB with active-active WAN links

Trend Micro - DDAN (Deep Discovery Analyzer) Sandboxing and Data Analysis

4-layer Architecture for securing Web, App and Database servers

Single Management Console for managing the Trend Micro products

Coverage of all hosted applications (except collocated applications) under 4-layer architecture</p>
                  <a href="assets/img/portfolio/branding-1.jpg" title="Branding 1" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                  <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-books">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/books-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Service Level Features</h4>
                  <p>Auto notification through SMS

Service Monitoring through EMS tool

Disk threshold alert

24x7 dedicated help desk for all (response time improved from few hours to few minutes)

Centralized log monitoring through SIEM tool

Close coordination with OEMs and authorized agencies for prompt resolution of technical issues

4 layer security for critical applications

Backup facility of all VMs</p>
                  <a href="assets/img/portfolio/books-1.jpg" title="Branding 1" data-gallery="portfolio-gallery-book" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                  <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <div class="portfolio-content h-100">
                <img src="assets/img/portfolio/app-2.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Service Level Features</h4>
                  <p>Auto notification through SMS

Service Monitoring thro EMS tool

Disk threshold alert

24x7 dedicated help desk for all (response time improved from few hours to few minutes)

Centralized log monitoring through SIEM tool

Close coordination with OEMs and authorized agencies for prompt resolution of technical issues

4 layer security for critical applications

Backup facility of all VMs</p>
                  <a href="assets/img/portfolio/app-2.jpg" title="App 2" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                  <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div><!-- End Portfolio Item -->


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
  

</body>

<footer id="footer" class="footer light-background">

  <div class="footer-top">
    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">DataCenter</span>
          </a>
          <div class="footer-contact pt-3">
            <p>Data Center HQ, Sector V</p>
            <p>Kolkata, WB 700091</p>
            <p class="mt-3"><strong>Phone:</strong> <span>+91 98765 43210</span></p>
            <p><strong>Email:</strong> <span>support@datacenter.gov.in</span></p>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Registration</a></li>
            <li><a href="#">Complaint Status</a></li>
            <li><a href="#">User Login</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Entity Registration</a></li>
            <li><a href="#">IT Asset Logging</a></li>
            <li><a href="#">Complaint Management</a></li>
            <li><a href="#">Performance Reports</a></li>
            <li><a href="#">24x7 Support</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Resources</h4>
          <ul>
            <li><a href="#">User Manual</a></li>
            <li><a href="#">Admin Guide</a></li>
            <li><a href="#">Policy Documents</a></li>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">Downloads</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Support</h4>
          <ul>
            <li><a href="#">Helpdesk</a></li>
            <li><a href="#">Raise a Ticket</a></li>
            <li><a href="#">Live Chat</a></li>
            <li><a href="#">Site Map</a></li>
            <li><a href="#">Feedback</a></li>
          </ul>
        </div>

      </div>
    </div>
  </div>

  <div class="copyright text-center">
    <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">

      <div class="d-flex flex-column align-items-center align-items-lg-start">
        <div>
          © Copyright <strong><span>Data Center Management System</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed and maintained by <a href="#">Data Center Technical Team</a>
        </div>
      </div>


    </div>
  </div>

</footer>

</html>



