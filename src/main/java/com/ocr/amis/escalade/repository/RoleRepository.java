package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByRolNom(String role);
}
