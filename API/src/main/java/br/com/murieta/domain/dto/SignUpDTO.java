package br.com.murieta.domain.dto;

import lombok.Data;

@Data
public class SignUpDTO {

    private String nome;
    private String email;
    private String password;
    private String passwordConfirm;

}
