package br.com.murieta.domain.service;

import br.com.murieta.domain.models.Text;
import br.com.murieta.domain.models.TextActivity;

public interface TextService {

    Text create(String text);
    Text getSong(String id);

    TextActivity link(String songId);
}
