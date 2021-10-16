package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Data
@Entity
public class Text {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "text_word",
            joinColumns = @JoinColumn(name = "text_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "word_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Word> words;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "text_phrases",
            joinColumns = @JoinColumn(name = "text_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "phrases_id", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private List<Phrase> phrases;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "text")
    @Fetch(FetchMode.SUBSELECT)
    private List<Card> wordCards;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "text")
    @Fetch(FetchMode.SUBSELECT)
    private List<Card> phraseCards;

}
