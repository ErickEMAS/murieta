package br.com.murieta.application.controllers;

import br.com.murieta.domain.dto.SignUpDTO;
import br.com.murieta.domain.models.User;
import br.com.murieta.domain.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/sign-up")
    public ResponseEntity<Object> signUp(@RequestBody SignUpDTO signupDTO) {
        try {
            return ResponseEntity.ok(userService.signUp(signupDTO));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @PostMapping("/update-user")
    public ResponseEntity<Object> updateUser(@RequestBody User user) {
        try {
            return ResponseEntity.ok(userService.updateUser(user));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }

    @PostMapping("/update-password")
    public ResponseEntity<Object> updatePassword(@RequestBody SignUpDTO userUpadtePassword) {
        try {
            return ResponseEntity.ok(userService.updatePassword(userUpadtePassword));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}

