package com.example.demo;

import jakarta.persistence.*;

@Entity
@Table(name = "vm_details")
public class VMDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String cpu;
    private String ram;
    private String disk;
    private String os;

    @Column(name = "database_name")
    private String database;

    @Column(name = "vm_type")
    private String vmType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "hosting_request_id", nullable = false)
    private HostingRequest hostingRequest;

    // ====== Getters and Setters ======
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCpu() { return cpu; }
    public void setCpu(String cpu) { this.cpu = cpu; }

    public String getRam() { return ram; }
    public void setRam(String ram) { this.ram = ram; }

    public String getDisk() { return disk; }
    public void setDisk(String disk) { this.disk = disk; }

    public String getOs() { return os; }
    public void setOs(String os) { this.os = os; }

    public String getDatabase() { return database; }
    public void setDatabase(String database) { this.database = database; }

    public String getVmType() { return vmType; }
    public void setVmType(String vmType) { this.vmType = vmType; }

    public HostingRequest getHostingRequest() { return hostingRequest; }
    public void setHostingRequest(HostingRequest hostingRequest) { this.hostingRequest = hostingRequest; }
}
