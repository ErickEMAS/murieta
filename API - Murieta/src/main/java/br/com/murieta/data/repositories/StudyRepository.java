package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Study;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudyRepository extends JpaRepository<Study, Integer> {
}
