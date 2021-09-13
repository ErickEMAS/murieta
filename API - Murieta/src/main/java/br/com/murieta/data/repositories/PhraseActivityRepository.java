package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Connections;
import br.com.murieta.domain.models.PhraseActivity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhraseActivityRepository extends JpaRepository<PhraseActivity, Integer> {
}
