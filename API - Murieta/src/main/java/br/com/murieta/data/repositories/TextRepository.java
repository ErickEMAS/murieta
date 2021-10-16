package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Text;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TextRepository extends JpaRepository<Text, Integer> {
}
