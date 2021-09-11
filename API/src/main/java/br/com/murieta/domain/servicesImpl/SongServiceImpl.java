package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.PhraseRepository;
import br.com.murieta.data.repositories.SongRepository;
import br.com.murieta.data.repositories.WordRepository;
import br.com.murieta.domain.models.Song;
import br.com.murieta.domain.models.Word;
import br.com.murieta.domain.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SongServiceImpl implements SongService {

    @Autowired
    private SongRepository songRepository;

    @Autowired
    private WordRepository wordRepository;

    @Autowired
    private PhraseRepository phraseRepository;

    @Override
    public Song create(String vagalumeId, String song) {
        List<String> songPhrses = new ArrayList<>();
        List<Word> wordList = new ArrayList<>();

        String text = song.replaceAll("[^a-zA-Z']", " ").toLowerCase();
        List<String> stringList = new ArrayList<String>(Arrays.asList(text.split(" ")));

        Set<String> set = new HashSet<>(stringList);
        stringList.clear();
        stringList.addAll(set);
        java.util.Collections.sort(stringList);

        stringList.forEach(word -> {
            if (word != " " && word.length() > 0) {
                Word newWord = new Word();
                newWord.setWord(word);
                wordList.add(newWord);
            }
        });

        Song newSong = new Song();

        newSong.setId(wordList.size());
        newSong.setVagalumeId(text);
        newSong.setWords(wordList);

        return newSong;
    }

}
