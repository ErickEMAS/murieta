package br.com.murieta.domain.models;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Connections {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String songActivitys;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "song_word",
            joinColumns = @JoinColumn(name = "song_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "word_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Word> words;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "song_phrases",
            joinColumns = @JoinColumn(name = "song_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "phrases_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Phrase> phrases;

}
