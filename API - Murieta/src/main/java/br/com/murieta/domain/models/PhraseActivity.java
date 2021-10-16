package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class PhraseActivity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "phraseactivity_phrase",
            joinColumns = @JoinColumn(name = "phraseactivity_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "phrase_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Phrase> phrases;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "phrase_id")
    private Phrase phrase;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "textactivity_id")
    private TextActivity textActivity;

}
