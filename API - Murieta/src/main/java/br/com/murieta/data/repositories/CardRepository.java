package br.com.murieta.data.repositories;


import br.com.murieta.domain.models.Card;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<Card, Integer> {
}
