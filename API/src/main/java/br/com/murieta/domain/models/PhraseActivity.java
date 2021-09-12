package br.com.murieta.domain.models;

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

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "wordactivity")
    @Fetch(FetchMode.SUBSELECT)
    private List<Word> words;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "wordactivity")
    @Fetch(FetchMode.SUBSELECT)
    private List<Study> studies;

}
