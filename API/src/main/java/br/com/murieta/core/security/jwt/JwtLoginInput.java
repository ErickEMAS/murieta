package br.com.murieta.core.security.jwt;

import lombok.Data;

@Data
class JwtLoginInput {
    private String email;
    private String password;
}
