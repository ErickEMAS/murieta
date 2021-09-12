package br.com.murieta.application.controllers;

import br.com.murieta.domain.dto.SignUpDTO;
import br.com.murieta.domain.dto.SongDTO;
import br.com.murieta.domain.models.User;
import br.com.murieta.domain.service.SongService;
import br.com.murieta.domain.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @PostMapping("/insert")
    public ResponseEntity<Object> insert(@RequestBody SongDTO songDTO) {
        try {
            return ResponseEntity.ok(songService.create(songDTO.getVagalumeId(), songDTO.getLyric()));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}

