package br.com.murieta.domain.service;

import br.com.murieta.domain.models.Song;

public interface SongService {

    Song create(String vagalumeId, String song);
    Song getSong(String id);

}
