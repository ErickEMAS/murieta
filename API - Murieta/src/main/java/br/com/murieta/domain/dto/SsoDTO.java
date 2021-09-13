package br.com.murieta.domain.dto;

import br.com.murieta.domain.models.User;
import lombok.Data;

@Data
public class SsoDTO {

    private String access_token;
    private User me;

}
