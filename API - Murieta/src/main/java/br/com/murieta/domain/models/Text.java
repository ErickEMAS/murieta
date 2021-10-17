package br.com.murieta.domain.models;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Text {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "text")
    @Fetch(FetchMode.SUBSELECT)
    private List<CardWord> wordCards;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "text")
    @Fetch(FetchMode.SUBSELECT)
    private List<CardPhrase> phraseCards;

}
