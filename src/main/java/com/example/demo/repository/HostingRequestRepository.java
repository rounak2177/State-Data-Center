package com.example.demo.repository;

import com.example.demo.HostingRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HostingRequestRepository extends JpaRepository<HostingRequest, Long> {

    // Find all hosting requests by status (e.g., PENDING, APPROVED)
    List<HostingRequest> findByStatus(String status);

    // Find all hosting requests submitted by a particular user
    List<HostingRequest> findByUserEmail(String userEmail);

    // You can add more custom queries here if needed
    
    Page<HostingRequest> findByStatus(String status, Pageable pageable);

    // Find hosting requests submitted by a particular user (paginated)
    Page<HostingRequest> findByUserEmail(String userEmail, Pageable pageable);
    
    // Find user's hosting requests with VM details eagerly loaded
    @Query("SELECT DISTINCT h FROM HostingRequest h LEFT JOIN FETCH h.vmList WHERE h.userEmail = ?1")
    List<HostingRequest> findByUserEmailWithVMDetails(String userEmail);
    
    // Find all hosting requests with VM details eagerly loaded
    @Query("SELECT DISTINCT h FROM HostingRequest h LEFT JOIN FETCH h.vmList")
    List<HostingRequest> findAllWithDetails();
    
    // Find all hosting requests with VM details eagerly loaded (paginated)
    @Query(value = "SELECT DISTINCT h FROM HostingRequest h LEFT JOIN FETCH h.vmList",
           countQuery = "SELECT COUNT(DISTINCT h) FROM HostingRequest h")
    Page<HostingRequest> findAllWithVMDetails(Pageable pageable);
}
