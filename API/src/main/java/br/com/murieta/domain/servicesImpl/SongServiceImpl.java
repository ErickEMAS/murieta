package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.*;
import br.com.murieta.domain.models.*;
import br.com.murieta.domain.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ConnectionsRepository connectionsRepository;

    @Autowired
    private SongActivityRepository songActivityRepository;

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

    @Override
    public Song getSong(String id) {
        Song fndSong = songRepository.findByVagalumeId(id);

        if (fndSong != null)
            return fndSong;

        fndSong = songRepository.findById(Integer.parseInt(id)).get();

        if (fndSong != null)
            return fndSong;

        throw new IllegalArgumentException("Nenhum musica foi localizada.");
    }

    @Override
    public SongActivity link(String songId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        currentUser = userRepository.findById(currentUser.getId()).get();

        Song song = getSong(songId);

        SongActivity fndsongActivity = songActivityRepository.findByConnections_IdAndSong_Id(currentUser.getConnections().getId(), song.getId());

        if (fndsongActivity != null)
            return fndsongActivity;

        SongActivity songActivity = new SongActivity();
        songActivity.setSong(song);
        songActivity.setConnections(currentUser.getConnections());

        return songActivityRepository.save(songActivity);
    }


}
