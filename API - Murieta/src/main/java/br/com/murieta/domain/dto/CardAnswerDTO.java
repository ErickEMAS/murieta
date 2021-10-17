package br.com.murieta.domain.dto;

import lombok.Data;
import org.springframework.web.bind.annotation.RequestParam;

@Data
public class CardAnswerDTO {

    private String cardId;
    private  boolean answer;
    private String type;

}
