package com.example.demo.repository;

import com.example.demo.VMDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VMDetailRepository extends JpaRepository<VMDetail, Long> {

    // Find VM details by HostingRequest ID
    VMDetail findByHostingRequestId(Long hostingRequestId);

    // Paginated query for VM details by HostingRequest ID
    Page<VMDetail> findByHostingRequestId(Long hostingRequestId, Pageable pageable);

    // Find a VM detail by OS
    VMDetail findByOs(String os);

    // Paginated query for VM details by OS
    Page<VMDetail> findByOs(String os, Pageable pageable);

    // Find a VM detail by CPU type
    VMDetail findByCpu(String cpu);

    // Paginated query for VM details by CPU type
    Page<VMDetail> findByCpu(String cpu, Pageable pageable);
}
