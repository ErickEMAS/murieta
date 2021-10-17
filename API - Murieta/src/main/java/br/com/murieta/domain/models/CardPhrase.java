package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
public class CardPhrase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer multiplier;
    private LocalDateTime libertyDate;
    private String back;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "phrase_id")
    private Phrase phrase;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "text_id")
    private Text text;

}
