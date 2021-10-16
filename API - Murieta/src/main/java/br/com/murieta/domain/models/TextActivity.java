package br.com.murieta.domain.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class TextActivity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "connections_id")
    private Connections connections;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "text_id")
    private Text text;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "textActivity")
    @Fetch(FetchMode.SUBSELECT)
    private List<WordActivity> wordActivities;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "textActivity")
    @Fetch(FetchMode.SUBSELECT)
    private List<PhraseActivity> phraseActivities;

}
