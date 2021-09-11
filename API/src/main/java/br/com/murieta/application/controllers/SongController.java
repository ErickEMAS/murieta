package br.com.murieta.application.controllers;

import br.com.murieta.domain.dto.SignUpDTO;
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
    public ResponseEntity<Object> insert() {
        try {
            return ResponseEntity.ok(songService.create("3ade68b8g122f00b3", "Dear darlin', please excuse my writing\nAnd I can't stop my hands from shaking\n'Cause I'm cold and alone tonight\n\nI miss you and nothing hurts like no you\nAnd no one understands what we went through\nIt was short, it was sweet, we tried\n\nAnd if my words break through the wall\nAnd meet you at your door\nAll I can say is \"Girl, I mean them all\"\n\nDear darlin', please excuse my writing\nI can't stop my hands from shaking\n'Cause I'm cold and alone tonight\n\nI miss you and nothing hurts like no you\nAnd no one understands what we went through\nIt was short, it was sweet, we tried\nWe tried\n\n(I understand where he's coming from)\n\nBeen thinking about the bar we drank in\nFeeling like the sofa was sinking\nI was warm in the hope of your eyes\n\nSo if my words break through the wall\nTo meet you at your door\nAll I can say is \"Girl, I mean them all\"\n\nDear darlin', please excuse my writing\nI can't stop my hands from shaking\n'Cause I'm cold and alone tonight\n\nI miss you and nothing hurts like no you\nAnd no one understands what we went through\nIt was short, it was sweet, we tried\n\nOh I concur\nThese arms are yours to hold\n\nAnd I miss you and nothing hurts like no you\nAnd no one understands what we went through\nIt was short, it was sweet, we tried\nWe tried"));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}

