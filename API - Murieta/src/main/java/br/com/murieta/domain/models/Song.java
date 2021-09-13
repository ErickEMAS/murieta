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
public class Song {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String vagalumeId;

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
