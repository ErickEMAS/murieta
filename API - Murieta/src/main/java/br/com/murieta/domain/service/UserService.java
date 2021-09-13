package br.com.murieta.domain.service;

import br.com.murieta.domain.dto.SignUpDTO;
import br.com.murieta.domain.models.User;

public interface UserService {

    User updateUser(User user);

    User signUp(SignUpDTO signUpDTO);

    User updatePassword(SignUpDTO userUpadtePassword);

}
