package br.com.murieta.domain.service;

import br.com.murieta.domain.models.Song;
import br.com.murieta.domain.models.SongActivity;

public interface SongService {

    Song create(String vagalumeId, String song);
    Song getSong(String id);

    SongActivity link(String songId);
}
