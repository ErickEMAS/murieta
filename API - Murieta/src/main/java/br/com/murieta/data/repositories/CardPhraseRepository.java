package br.com.murieta.data.repositories;


import br.com.murieta.domain.models.CardPhrase;
import br.com.murieta.domain.models.CardWord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardPhraseRepository extends JpaRepository<CardPhrase, Integer> {
}
