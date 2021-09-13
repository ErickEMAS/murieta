package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.Connections;
import br.com.murieta.domain.models.SongActivity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SongActivityRepository extends JpaRepository<SongActivity, Integer> {

    SongActivity findByConnections_IdAndSong_Id(Integer connectionId, Integer songId);

}
