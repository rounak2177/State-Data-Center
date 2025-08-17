package com.example.demo.repository;

import com.example.demo.HostingRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HostingRequestRepository extends JpaRepository<HostingRequest, Long> {

    // Find all hosting requests by status (e.g., PENDING, APPROVED)
    List<HostingRequest> findByStatus(String status);

    // Find all hosting requests submitted by a particular user
    HostingRequest findByUserEmail(String userEmail);

    // You can add more custom queries here if needed
    
    Page<HostingRequest> findByStatus(String status, Pageable pageable);

    // Find hosting requests submitted by a particular user (paginated)
    Page<HostingRequest> findByUserEmail(String userEmail, Pageable pageable);
    
}
