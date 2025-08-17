package com.example.demo;

import jakarta.persistence.*;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "category")
    private String category;

    @Column(name = "admin_type")
    private String adminType;

    @Column(name = "state")
    private String state;

    @Column(name = "department")
    private String departments;

    @Column(name = "district")
    private String districts;

    @Column(name = "entity_type")
    private String entityTypes;

    @Column(name = "entity_name")
    private String entityName;

    @Column(name = "website")
    private String website;

    @Column(name = "address")
    private String address;

    @Column(name = "officer_name")
    private String officerName;

    @Column(name = "mobile", length = 15)
    private String mobile;

    @Column(name = "designation")
    private String designation;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "authority_letter_path")
    private String authorityLetterPath;

    @Column(name = "status")
    private String status = "PENDING";

    @Column(name = "role")
    private String role = "USER";

    // ======== Getters and Setters ========

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAdminType() {
        return adminType;
    }

    public void setAdminType(String adminType) {
        this.adminType = adminType;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDepartments() {
        return departments;
    }

    public void setDepartments(String departments) {
        this.departments = departments;
    }

    public String getDistricts() {
        return districts;
    }

    public void setDistricts(String districts) {
        this.districts = districts;
    }

    public String getEntityTypes() {
        return entityTypes;
    }

    public void setEntityTypes(String entityTypes) {
        this.entityTypes = entityTypes;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOfficerName() {
        return officerName;
    }

    public void setOfficerName(String officerName) {
        this.officerName = officerName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAuthorityLetterPath() {
        return authorityLetterPath;
    }

    public void setAuthorityLetterPath(String authorityLetterPath) {
        this.authorityLetterPath = authorityLetterPath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
