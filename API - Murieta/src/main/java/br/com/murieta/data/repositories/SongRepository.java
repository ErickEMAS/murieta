package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Song;
import br.com.murieta.domain.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SongRepository extends JpaRepository<Song, Integer> {

    Song findByVagalumeId(String vagalumeId);

}
