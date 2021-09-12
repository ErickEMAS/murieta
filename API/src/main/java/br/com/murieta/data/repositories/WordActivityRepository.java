package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.SongActivity;
import br.com.murieta.domain.models.WordActivity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WordActivityRepository extends JpaRepository<WordActivity, Integer> {
}
