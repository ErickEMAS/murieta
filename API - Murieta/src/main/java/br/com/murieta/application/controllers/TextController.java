package br.com.murieta.application.controllers;

import br.com.murieta.domain.service.TextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/song")
public class TextController {

    @Autowired
    private TextService songService;

    @PostMapping("/insert")
    public ResponseEntity<Object> insert(@RequestBody String text) {
        try {
            return ResponseEntity.ok(songService.create(text));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @GetMapping("/get-song")
    public ResponseEntity<Object> getSong(@RequestParam String id) {
        try {
            return ResponseEntity.ok(songService.getSong(id));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @PostMapping("/link")
    public ResponseEntity<Object> link(@RequestBody String songId) {
        try {
            return ResponseEntity.ok(songService.link(songId));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}

