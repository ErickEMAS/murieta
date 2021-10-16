package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String type;
    private Integer multiplier;
    private LocalDateTime libertyDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "word_id")
    private Word word;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "phrase_id")
    private Phrase phrase;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "text_id")
    private Text text;

}
