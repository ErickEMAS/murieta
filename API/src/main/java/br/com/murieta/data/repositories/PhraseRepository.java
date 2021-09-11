package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Phrase;
import br.com.murieta.domain.models.Word;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhraseRepository extends JpaRepository<Phrase, Integer> {
}
