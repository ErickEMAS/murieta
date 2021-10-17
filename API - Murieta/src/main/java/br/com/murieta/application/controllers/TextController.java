package br.com.murieta.application.controllers;

import br.com.murieta.domain.dto.CardAnswerDTO;
import br.com.murieta.domain.dto.TextDTO;
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
    public ResponseEntity<Object> insert(@RequestBody TextDTO textDTO) {
        try {
            return ResponseEntity.ok(songService.create(textDTO));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @GetMapping("/study-text")
    public ResponseEntity<Object> startStudy(@RequestParam String textId, @RequestParam String type) {
        try {
            return ResponseEntity.ok(songService.studyCards(textId, type));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @GetMapping("/get-card")
    public ResponseEntity<Object> getCard(@RequestParam String cardtId, @RequestParam String type) {
        try {
            return ResponseEntity.ok(songService.getCard(cardtId, type));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @PostMapping("/study-card")
    public ResponseEntity<Object> studyCard(@RequestBody CardAnswerDTO cardAnswerDTO) {
        try {
            return ResponseEntity.ok(songService.answerCard(cardAnswerDTO));
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

