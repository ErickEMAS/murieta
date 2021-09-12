package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class WordActivity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "wordactivity_word",
            joinColumns = @JoinColumn(name = "wordactivity_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "word_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Word> words;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "word_id")
    private Word word;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "songactivity_id")
    private SongActivity songActivity;


}
