package br.com.murieta.data.repositories;

import br.com.murieta.domain.models.TextActivity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TextActivityRepository extends JpaRepository<TextActivity, Integer> {

    TextActivity findByConnections_IdAndText_Id(Integer connectionId, Integer textId);

}
