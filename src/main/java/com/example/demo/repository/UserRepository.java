package com.example.demo.repository;

import com.example.demo.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Find a single user by email
    User findByEmail(String email);

    // ✅ Example: Paginated search by email
    Page<User> findByEmailContainingIgnoreCase(String email, Pageable pageable);
}

