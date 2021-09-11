package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Word;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WordRepository extends JpaRepository<Word, Integer> {
}
