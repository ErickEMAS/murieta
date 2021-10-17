package br.com.murieta.data.repositories;


import br.com.murieta.domain.models.CardWord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardWordRepository extends JpaRepository<CardWord, Integer> {
}
