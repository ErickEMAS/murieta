package br.com.murieta.domain.service;

import br.com.murieta.domain.dto.CardAnswerDTO;
import br.com.murieta.domain.dto.TextDTO;
import br.com.murieta.domain.models.Text;
import br.com.murieta.domain.models.TextActivity;

import java.util.List;

public interface TextService {

    Text create(TextDTO textDTO);
    Text getSong(String id);

    TextActivity link(String songId);

    Text studyCards(String textId, String type);
    boolean answerCard(CardAnswerDTO cardAnswerDTO);
    Object getCard(String cardId, String type);
}
