package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConnectionRepository extends JpaRepository<User, Integer> {
}
