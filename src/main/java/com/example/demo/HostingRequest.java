package com.example.demo;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "hosting_requests")
public class HostingRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "application_name", nullable = false)
    private String applicationName;

    @Column(name = "domain_name", nullable = false)
    private String domainName;

    @Column(name = "vm_count", nullable = false)
    private int vmCount;

    @Column(nullable = false)
    private String status = "PENDING"; // Default status

    @Column(name = "user_email", nullable = false)
    private String userEmail;

    @Column(name = "total_fee")
    private int totalFee;

    @Column(name = "fee_paid", nullable = false)
    private String feePaid = "Unpaid";

    // Relation with VMDetail
    @OneToMany(mappedBy = "hostingRequest", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<VMDetail> vmList = new ArrayList<>();

    // Fee calculation logic
    public int calculateHostingFee() {
        int baseFee = 25000;
        int totalComponentFee = 0;

        for (VMDetail vm : vmList) {
            if (vm.getCpu() == null || vm.getRam() == null || vm.getDisk() == null) {
                continue; // skip incomplete VM data
            }

            int cpuFee = switch (vm.getCpu()) {
                case "2" -> 1500;
                case "3" -> 6000;
                case "4" -> 10000;
                case "6" -> 15000;
                case "8" -> 24000;
                case "16" -> 32000;
                default -> 0;
            };

            int ramFee = switch (vm.getRam()) {
                case "4GB" -> 800;
                case "8GB" -> 2500;
                case "16GB" -> 4000;
                case "32GB" -> 8000;
                default -> 0;
            };

            int diskFee = switch (vm.getDisk()) {
                case "128GB" -> 1200;
                case "256GB" -> 2800;
                case "512GB" -> 3500;
                case "1TB" -> 5000;
                case "2TB" -> 12000;
                default -> 0;
            };

            totalComponentFee += cpuFee + ramFee + diskFee;
        }
        return baseFee + totalComponentFee;
    }

    // ====== Getters and Setters ======
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getApplicationName() { return applicationName; }
    public void setApplicationName(String applicationName) { this.applicationName = applicationName; }

    public String getDomainName() { return domainName; }
    public void setDomainName(String domainName) { this.domainName = domainName; }

    public int getVmCount() { return vmCount; }
    public void setVmCount(int vmCount) { this.vmCount = vmCount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public int getTotalFee() { return totalFee; }
    public void setTotalFee(int totalFee) { this.totalFee = totalFee; }

    public String getFeePaid() { return feePaid; }
    public void setFeePaid(String feePaid) { this.feePaid = feePaid; }

    public List<VMDetail> getVmList() { return vmList; }
    public void setVmList(List<VMDetail> vmList) {
        this.vmList.clear();
        if (vmList != null) {
            vmList.forEach(vm -> vm.setHostingRequest(this));
            this.vmList.addAll(vmList);
        }
    }
}
