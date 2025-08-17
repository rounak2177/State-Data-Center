package com.example.demo;

import com.example.demo.repository.HostingRequestRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.repository.AdminRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

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

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Value("${file.upload-dir}")
    private String uploadDir;
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

        try {
            // 1. Validate input
            if (email == null || email.trim().isEmpty()) {
                model.addAttribute("error", "Email is required.");
                return "login";
            }

            // 2. Dummy CAPTCHA validation
            if (!"1234".equals(captcha)) {
                model.addAttribute("error", "Invalid CAPTCHA code.");
                return "login";
            }

            // 3. Find user and handle case sensitivity
            User user = userRepository.findByEmail(email.toLowerCase().trim());

            if (user == null) {
                model.addAttribute("error", "No account found with this email address.");
                return "login";
            }

            // 4. Check user status
            if (!"APPROVED".equalsIgnoreCase(user.getStatus())) {
                model.addAttribute("error", "Your account is pending approval. Please contact the administrator.");
                return "login";
            }

            // 5. Store user in session
            session.setAttribute("loggedInUser", user);
            
            // 6. Redirect to dashboard
            return "redirect:/user-dashboard";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "An error occurred during login. Please try again.");
            return "login";
        }
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

            String originalFileName = authorityLetter.getOriginalFilename();
            if (originalFileName == null || originalFileName.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "No file selected.");
                return "redirect:/register";
            }
            
            originalFileName = StringUtils.cleanPath(originalFileName);
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
        Page<HostingRequest> hostingRequestPage = hostingRequestRepository.findAllWithVMDetails(pageable);

        model.addAttribute("hostingRequests", hostingRequestPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", hostingRequestPage.getTotalPages());
        model.addAttribute("pageSize", size);

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

        // Get user's hosting requests with VM details eagerly loaded
        List<HostingRequest> userRequests = hostingRequestRepository.findByUserEmailWithVMDetails(user.getEmail());
        model.addAttribute("userRequests", userRequests);
        model.addAttribute("user", user);
        return "user-dashboard";
    }
    
    @Autowired
    private HostingRequestRepository hostingRequestRepository;

    // GET form
    @PostMapping("/hosting-request")
    public String submitHostingForm(@RequestParam String applicationName,
                                  @RequestParam String domainName,
                                  @RequestParam int vmCount,
                                  @RequestParam(required = false) List<String> cpu,
                                  @RequestParam(required = false) List<String> ram,
                                  @RequestParam(required = false) List<String> disk,
                                  @RequestParam(required = false) List<String> os,
                                  @RequestParam(required = false) List<String> database,
                                  @RequestParam(required = false) List<String> vmType,
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {
        try {
            User user = (User) session.getAttribute("loggedInUser");

            // 1. Ensure user is logged in
            if (user == null) {
                return "redirect:/login";
            }

            // 2. Ensure user is approved
            if (!"APPROVED".equalsIgnoreCase(user.getStatus())) {
                redirectAttributes.addFlashAttribute("error",
                        "Your account is not approved to make hosting requests.");
                return "redirect:/user-dashboard";
            }

            // 3. Create hosting request
            HostingRequest hostingRequest = new HostingRequest();
            hostingRequest.setApplicationName(applicationName);
            hostingRequest.setDomainName(domainName);
            hostingRequest.setVmCount(vmCount);
            hostingRequest.setUserEmail(user.getEmail());
            hostingRequest.setStatus("PENDING");
            hostingRequest.setFeePaid("Unpaid");

            // 4. Create VM details
            List<VMDetail> vmList = new ArrayList<>();
            for (int i = 0; i < vmCount; i++) {
                if (cpu != null && i < cpu.size()) {
                    VMDetail vm = new VMDetail();
                    vm.setCpu(cpu.get(i));
                    vm.setRam(ram.get(i));
                    vm.setDisk(disk.get(i));
                    vm.setOs(os.get(i));
                    vm.setDatabase(database.get(i));
                    vm.setVmType(vmType.get(i));
                    vm.setHostingRequest(hostingRequest);
                    vmList.add(vm);
                }
            }
            hostingRequest.setVmList(vmList);

            // 5. Calculate and set total fee
            hostingRequest.setTotalFee(hostingRequest.calculateHostingFee());

            // 6. Save hosting request
            hostingRequestRepository.save(hostingRequest);

            // 7. Add success message
            redirectAttributes.addFlashAttribute("msg",
                    "Hosting request submitted successfully! Total fee: " +
                    hostingRequest.getTotalFee() + " (Unpaid)");

            return "redirect:/user-dashboard";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error",
                    "Failed to submit hosting request. Please try again.");
            return "redirect:/user-dashboard";
        }
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

        List<HostingRequest> requests = hostingRequestRepository.findByUserEmail(email);

        if (requests.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "No hosting request found for this email.");
            return "redirect:/pay-fee";
        }

        // Get the most recent request
        HostingRequest request = requests.get(requests.size() - 1);

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





