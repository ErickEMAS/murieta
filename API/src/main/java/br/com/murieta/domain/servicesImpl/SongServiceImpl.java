package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.PhraseRepository;
import br.com.murieta.data.repositories.SongRepository;
import br.com.murieta.data.repositories.WordRepository;
import br.com.murieta.domain.models.Phrase;
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
    public Song create(String vagalumeId, String lyric) {
        Song fndSong = songRepository.findByVagalumeId(vagalumeId);

        if (fndSong != null)
            return fndSong;

        List<Phrase> phraseList = new ArrayList<>();
        List<Word> wordList = new ArrayList<>();

        String text = lyric.replaceAll("[^a-zA-Z']", " ").toLowerCase();
        List<String> stringList = new ArrayList<String>(Arrays.asList(text.split(" ")));

        Set<String> set = new HashSet<>(stringList);
        stringList.clear();
        stringList.addAll(set);
        java.util.Collections.sort(stringList);

        stringList.forEach(string -> {
            if (string != " " && string.length() > 0) {
                Word fndWord = wordRepository.findByWord(string);

                if (fndWord == null) {
                    Word newWord = new Word();
                    newWord.setWord(string);

                    wordList.add(wordRepository.save(newWord));
                } else {
                    wordList.add(fndWord);
                }


            }
        });

        text = lyric.replaceAll("[^a-zA-Z',.:; /!()]", "@").toLowerCase().replaceAll("[,.:;/!()]", "@");
        stringList = new ArrayList<String>(Arrays.asList(text.split("@")));

        for (int i = 0; i < stringList.size(); i++) {
            if (stringList.get(i).length() > 0 && stringList.get(i).charAt(0) == ' ') {
                stringList.set(i, stringList.get(i).substring(1));
            }
        }

        stringList.forEach(string -> {
            if (string.startsWith(" ")) {
                Phrase newPhrase = new Phrase();
                newPhrase.setPhrase(string);
                phraseList.add(newPhrase);
            }
        });

        set = new HashSet<>(stringList);
        stringList.clear();
        stringList.addAll(set);
        java.util.Collections.sort(stringList);

        stringList.forEach(string -> {
            if (string != " " && string != "?" && string.length() > 1) {
                Phrase fndPhrase = phraseRepository.findByPhrase(string);

                if (fndPhrase == null) {
                    Phrase newPhrase = new Phrase();
                    newPhrase.setPhrase(string);

                    phraseList.add(phraseRepository.save(newPhrase));
                } else {
                    phraseList.add(fndPhrase);
                }
            }
        });

        Song newSong = new Song();

        newSong.setVagalumeId(vagalumeId);
        newSong.setWords(wordList);
        newSong.setPhrases(phraseList);

        return songRepository.save(newSong);
    }

}
