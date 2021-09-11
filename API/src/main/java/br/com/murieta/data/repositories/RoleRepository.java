package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {
}
