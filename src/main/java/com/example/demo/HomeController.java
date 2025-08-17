package com.example.demo;

import com.example.demo.repository.HostingRequestRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.repository.AdminRepository;
import com.example.demo.User;
import com.example.demo.Admin;
import com.example.demo.HostingRequest;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import java.nio.file.*;
import java.util.UUID;

import jakarta.annotation.PostConstruct;

import org.springframework.data.domain.Sort;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;


@Controller
public class HomeController {

	User user = new User(); // ← directly used
	Admin admin = new Admin(); // ← directly used
	HostingRequest req = new HostingRequest(); // ← directly used

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private UserRepository userRepository;
    
    private final String uploadDir = "uploads";
    // ---------- Landing ----------
    @GetMapping("/")
    public String indexPage() {
        return "index6";
    }

    @GetMapping("/home")
    public String homePage() {
        return "home";
    }

    // ---------- Login ----------
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String captcha,
                            Model model,
                            HttpSession session) {

        // Dummy CAPTCHA validation
        if (!"1234".equals(captcha)) {
            model.addAttribute("error", "Invalid CAPTCHA.");
            return "login";
        }

        User user = userRepository.findByEmail(email);

        if (user == null) {
            model.addAttribute("error", "User not found.");
            return "login";
        }

        // Check if user is approved
        if (!"APPROVED".equalsIgnoreCase(user.getStatus())) {
            model.addAttribute("error", "Your account is not approved yet.");
            return "login";
        }

        // Store user in session
        session.setAttribute("loggedInUser", user);

        // Redirect to user dashboard only
        return "redirect:/user-dashboard";
    }


    // ---------- Registration ----------
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    

    @PostMapping("/signup")
    public String registerUser(
            @RequestParam String category,
            @RequestParam String adminType,
            @RequestParam String state,
            @RequestParam(required = false) String departments,
            @RequestParam(required = false) String districts,
            @RequestParam String entityTypes,
            @RequestParam String entityName,
            @RequestParam String website,
            @RequestParam String address,
            @RequestParam String officerName,
            @RequestParam String mobile,
            @RequestParam String designation,
            @RequestParam String email,
            @RequestParam("authorityLetter") MultipartFile authorityLetter,
            RedirectAttributes redirectAttributes,
            Model model,
            HttpSession session) {

        try {
            if (userRepository.findByEmail(email) != null) {
                model.addAttribute("error", "Email already exists.");
                return "register";
            }

            // -------- File Upload Validation --------
            if (authorityLetter.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Authority letter is required.");
                return "redirect:/register";
            }

            String originalFileName = StringUtils.cleanPath(authorityLetter.getOriginalFilename());
            if (originalFileName == null || originalFileName.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "No file selected.");
                return "redirect:/register";
            }

            if (!originalFileName.toLowerCase().endsWith(".pdf")) {
                redirectAttributes.addFlashAttribute("error", "Only PDF files are allowed.");
                return "redirect:/register";
            }

            if (authorityLetter.getSize() > 2 * 1024 * 1024) {
                redirectAttributes.addFlashAttribute("error", "File size exceeds 2MB.");
                return "redirect:/register";
            }

            String uploadPathString = "uploads/authority_letters/";
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;
            Path filePath = uploadPath.resolve(uniqueFileName);
            Files.copy(authorityLetter.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // -------- Create & Save User --------
            User user = new User();
            user.setCategory(category);
            user.setAdminType(adminType);
            user.setState(state);
            user.setDepartments(departments);
            user.setDistricts(districts);
            user.setEntityTypes(entityTypes);
            user.setEntityName(entityName);
            user.setWebsite(website);
            user.setAddress(address);
            user.setOfficerName(officerName);
            user.setMobile(mobile);
            user.setDesignation(designation);
            user.setEmail(email);
            user.setStatus("PENDING");
            user.setAuthorityLetterPath(uploadPathString + uniqueFileName);

            userRepository.save(user);
            redirectAttributes.addFlashAttribute("msg", "Registration successful! Please login.");
            return "redirect:/login";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Registration failed due to server error.");
            return "register";
        }
    }
    
    @GetMapping("/admin-login")
    public String adminLoginPage() {
        return "admin-login";
    }
    
    @GetMapping("/admin-home")
    public String showAdminHomePage() {
        return "admin-home"; // Matches admin-home.jsp in /WEB-INF/views/
    }

    @PostMapping("/admin-login")
    public String adminLogin(@RequestParam String email, @RequestParam String password,
                             Model model, HttpSession session) {
        Admin admin = adminRepository.findByEmail(email);
        if (admin != null && admin.getPassword().equals(password)) {
            session.setAttribute("admin", admin);
            return "redirect:/admin-home";
        } else {
            model.addAttribute("error", "Invalid admin credentials.");
            return "admin-login";
        }
    }
    @GetMapping("/admin-signup")
    public String adminsignupPage() {
        return "admin-signup";
    }

    @PostMapping("/admin-signup")
    public String registerAdmin(@RequestParam String name, 
                                @RequestParam String email,
                                @RequestParam String mobile, 
                                @RequestParam String password,
                                RedirectAttributes redirectAttributes, 
                                Model model) {
        if (adminRepository.findByEmail(email) != null) {
            model.addAttribute("error", "Email already exists.");
            return "admin-signup";
        }

        Admin admin = new Admin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setMobile(mobile);
        admin.setPassword(password);
        adminRepository.save(admin);

        redirectAttributes.addFlashAttribute("msg", "Admin signup successful. Please login.");
        return "redirect:/admin-login";
    }

    @GetMapping("/admin-dashboard")
    public String showAdminDashboard(
            @RequestParam(defaultValue = "0") int page,      // Page index starts from 0
            @RequestParam(defaultValue = "10") int size,     // Items per page
            Model model) {

        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.ASC, "id"));
        Page<User> userPage = userRepository.findAll(pageable); // Use JPA's built-in paging

        model.addAttribute("users", userPage.getContent()); // Current page content
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("totalItems", userPage.getTotalElements());

        return "admin-dashboard";
    }


    @GetMapping("/hosting-requestdashboard")
    public String showHostingRequestDashboard(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);
        Page<HostingRequest> hostingRequestPage = hostingRequestRepository.findAll(pageable);

        model.addAttribute("hostingRequests", hostingRequestPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", hostingRequestPage.getTotalPages());

        return "hosting-requestdashboard";
    }



    @PostMapping("/update-approvals")
    public String updateApprovals(@RequestParam Map<String, String> allParams,
                                  RedirectAttributes redirectAttributes) {
        for (Map.Entry<String, String> entry : allParams.entrySet()) {
            String key = entry.getKey();
            String status = entry.getValue();

            if (key.startsWith("status[") && key.endsWith("]")) {
                try {
                    Long id = Long.parseLong(key.substring(7, key.length() - 1));
                    Optional<User> userOpt = userRepository.findById(id);
                    userOpt.ifPresent(user -> {
                        user.setStatus(status);  // ✅ Set 'status' not 'approval'
                        userRepository.save(user);
                    });
                } catch (NumberFormatException ignored) {}
            }
        }
        redirectAttributes.addFlashAttribute("success", "Status updated successfully.");
        return "redirect:/admin-dashboard";
    }
    
    @PostMapping("/user-dashboard")
    public String showUserDashboard(@RequestParam String email,
                                    RedirectAttributes redirectAttributes,
                                    HttpSession session) {

        User user = userRepository.findByEmail(email);

        if (user != null && "APPROVED".equalsIgnoreCase(user.getStatus())) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/user-dashboard";  // redirects to GET method below
        } else {
            redirectAttributes.addFlashAttribute("error", "User not approved or not found.");
            return "redirect:/login";
        }
    }

    @GetMapping("/user-dashboard")
    public String loadUserDashboard(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);
        return "user-dashboard";
    }
    
    @Autowired
    private HostingRequestRepository hostingRequestRepository;

    // GET form
    @PostMapping("/hosting-request")
    public String submitHostingForm(@ModelAttribute HostingRequest hostingRequest,
                                     HttpSession session,
                                     RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");

        // 1. Ensure user is logged in
        if (user == null) {
            return "redirect:/login";
        }

        // 2. Ensure user is approved before making hosting requests
        if (!"APPROVED".equalsIgnoreCase(user.getStatus())) {
            redirectAttributes.addFlashAttribute("error",
                    "Your account is not approved to make hosting requests.");
            return "redirect:/user-dashboard";
        }

        // 3. Attach logged-in user's email to the hosting request
        hostingRequest.setUserEmail(user.getEmail());

        // 4. Explicitly set default status and payment status
        hostingRequest.setStatus("PENDING"); 
        hostingRequest.setFeePaid("Unpaid"); // ✅ String value

        // 5. Calculate and store total fee in DB
        hostingRequest.setTotalFee(hostingRequest.calculateHostingFee());

        // 6. Save hosting request
        hostingRequestRepository.save(hostingRequest);

        // 7. Add success message
        redirectAttributes.addFlashAttribute("msg",
                "Hosting request submitted successfully! Total fee: " +
                hostingRequest.getTotalFee() + " (Unpaid)");

        return "redirect:/user-dashboard";
    }

    @PostConstruct
    public void updateOldRequests() {
        List<HostingRequest> requests = hostingRequestRepository.findAll();
        for (HostingRequest req : requests) {
            if (req.getTotalFee() == 0) { // Or check for null if primitive changed to Integer
                req.setTotalFee(req.calculateHostingFee());
                hostingRequestRepository.save(req);
            }
        }
    }
    
    @PostMapping("/update-hosting-approvals")
    public String updateHostingApprovals(@RequestParam Map<String, String> allParams,
                                         RedirectAttributes redirectAttributes) {

        for (Map.Entry<String, String> entry : allParams.entrySet()) {
            String key = entry.getKey();
            String status = entry.getValue();

            if (key.startsWith("hostingStatus[") && key.endsWith("]")) {
                try {
                    Long id = Long.parseLong(key.substring(14, key.length() - 1)); // "hostingStatus[" = 14 chars
                    Optional<HostingRequest> reqOpt = hostingRequestRepository.findById(id);
                    reqOpt.ifPresent(req -> {
                        req.setStatus(status);
                        hostingRequestRepository.save(req);
                    });
                } catch (NumberFormatException ignored) {}
            }
        }

        redirectAttributes.addFlashAttribute("success", "Hosting request approvals updated successfully.");
        return "redirect:/hosting-requestdashboard";
    }

    
    @GetMapping("/user-details/{id}")
    public String viewUserDetails(@PathVariable Long id, Model model) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " + id));
        model.addAttribute("user", user);
        return "user-details";
    }

    // Step 1: Show the pay-fee form
    @GetMapping("/pay-fee")
    public String showPayFeeForm() {
        return "pay-fee"; // JSP form where user enters email
    }

    // Step 2: Process email and check approval
    @PostMapping("/pay-fee")
    public String processPayFee(@RequestParam("email") String email,
                                RedirectAttributes redirectAttributes,
                                Model model) {

        HostingRequest request = hostingRequestRepository.findByUserEmail(email);

        if (request == null) {
            redirectAttributes.addFlashAttribute("error", "No hosting request found for this email.");
            return "redirect:/pay-fee";
        }

        if (!"APPROVED".equalsIgnoreCase(request.getStatus())) {
            redirectAttributes.addFlashAttribute("error", "Your hosting request has not been approved yet.");
            return "redirect:/pay-fee";
        }

        // Calculate fee and store it
        int calculatedFee = request.calculateHostingFee();
        request.setTotalFee(calculatedFee);
        hostingRequestRepository.save(request);

        // Pass data to check-approval page
        model.addAttribute("hostingRequest", request);
        model.addAttribute("totalFee", calculatedFee);

        return "check-approval"; // JSP page with payment button
    }

    // Step 3: Handle dummy payment
    @PostMapping("/submit-fee/{id}")
    public String submitFee(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        HostingRequest request = hostingRequestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Hosting request not found"));

        request.setFeePaid("Paid");
        hostingRequestRepository.save(request);

        redirectAttributes.addFlashAttribute("msg", "Payment successful!");
        return "redirect:/user-dashboard"; // Change to wherever you want after payment
    }
}





