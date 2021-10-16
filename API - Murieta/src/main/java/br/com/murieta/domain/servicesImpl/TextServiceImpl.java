package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.*;
import br.com.murieta.domain.models.*;
import br.com.murieta.domain.service.TextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class TextServiceImpl implements TextService {

    @Autowired
    private TextRepository textRepository;

    @Autowired
    private WordRepository wordRepository;

    @Autowired
    private PhraseRepository phraseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ConnectionsRepository connectionsRepository;

    @Autowired
    private TextActivityRepository textActivityRepository;

    @Autowired
    private CardRepository cardRepository;

    @Override
    public Text create(String lyric) {
        Text newText = new Text();
        newText.setTitle("teste");
        newText = textRepository.save(newText);

        final int textId = newText.getId();

        List<Card> phraseCards = new ArrayList<>();
        List<Card> wordCards = new ArrayList<>();

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
                    fndWord = wordRepository.save(newWord);
                }

                Text textN = new Text();
                textN.setId(textId);

                Card newCard = new Card();

                newCard.setMultiplier(-1);
                newCard.setType("word");
                newCard.setLibertyDate(LocalDateTime.now());
                newCard.setWord(fndWord);
                newCard.setText(textN);
                cardRepository.save(newCard);

                wordCards.add(newCard);


            }
        });

        text = lyric.replaceAll("[^a-zA-Z',.:; /!()]", "@").toLowerCase().replaceAll("[,.:;/!()]", "@");
        stringList = new ArrayList<String>(Arrays.asList(text.split("@")));

        for (int i = 0; i < stringList.size(); i++) {
            if (stringList.get(i).length() > 0 && stringList.get(i).charAt(0) == ' ') {
                stringList.set(i, stringList.get(i).substring(1));
            }
        }

//        stringList.forEach(string -> {
//            if (string.startsWith(" ")) {
//                Phrase newPhrase = new Phrase();
//                newPhrase.setPhrase(string);
//                phraseList.add(newPhrase);
//            }
//        });

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
                    fndPhrase = phraseRepository.save(newPhrase);
                }

                Text textN = new Text();
                textN.setId(textId);

                Card newCard = new Card();

                newCard.setMultiplier(-1);
                newCard.setType("phrase");
                newCard.setLibertyDate(LocalDateTime.now());
                newCard.setPhrase(fndPhrase);
                newCard.setText(textN);
                cardRepository.save(newCard);

                phraseCards.add(newCard);

            }
        });

        newText.setWordCards(wordCards);
        newText.setPhraseCards(phraseCards);

        return textRepository.save(newText);
    }

    @Override
    public Text getSong(String id) {
        Text fndSong = textRepository.findById(Integer.parseInt(id)).get();

        if (fndSong != null)
            return fndSong;

        throw new IllegalArgumentException("Nenhum musica foi localizada.");
    }

    @Override
    public TextActivity link(String songId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        currentUser = userRepository.findById(currentUser.getId()).get();

        Text song = getSong(songId);

        TextActivity fndsongActivity = textActivityRepository.findByConnections_IdAndText_Id(currentUser.getConnections().getId(), song.getId());

        if (fndsongActivity != null)
            return fndsongActivity;

        TextActivity songActivity = new TextActivity();
        songActivity.setText(song);
        songActivity.setConnections(currentUser.getConnections());

        return textActivityRepository.save(songActivity);
    }


}
