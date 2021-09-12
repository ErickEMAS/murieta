package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Connections;
import br.com.murieta.domain.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConnectionsRepository extends JpaRepository<Connections, Integer> {
}
