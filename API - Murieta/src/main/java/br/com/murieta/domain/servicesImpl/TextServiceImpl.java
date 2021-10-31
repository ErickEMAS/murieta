package br.com.murieta.domain.servicesImpl;

import br.com.murieta.data.repositories.*;
import br.com.murieta.domain.dto.CardAnswerDTO;
import br.com.murieta.domain.dto.TextDTO;
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
    private CardWordRepository cardWordRepository;

    @Autowired
    private CardPhraseRepository cardPhraseRepository;

    @Override
    public Text create(TextDTO textDTO) {
        Text newText = new Text();
        newText.setTitle(textDTO.getTitle());
        newText = textRepository.save(newText);

        final int textId = newText.getId();

        List<CardWord> wordCards = new ArrayList<>();
        List<CardPhrase> phraseCards = new ArrayList<>();

        String text = textDTO.getText().replaceAll("[^a-zA-Z']", " ").toLowerCase();
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

                CardWord newCard = new CardWord();

                newCard.setMultiplier(-1);
                newCard.setLibertyDate(LocalDateTime.now());
                newCard.setWord(fndWord);
                newCard.setText(textN);
                cardWordRepository.save(newCard);

                wordCards.add(newCard);


            }
        });

        text = textDTO.getText().replaceAll("[^a-zA-Z',.:; /!()]", "@").toLowerCase().replaceAll("[,.:;/!()]", "@");
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

                CardPhrase newCard = new CardPhrase();

                newCard.setMultiplier(-1);
                newCard.setLibertyDate(LocalDateTime.now());
                newCard.setPhrase(fndPhrase);
                newCard.setText(textN);
                cardPhraseRepository.save(newCard);

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
    public Text studyCards(String textId, String type) {
        Text fndText = textRepository.findById(Integer.parseInt(textId)).get();
        Text textRet = new Text();

        if (fndText == null) throw new IllegalArgumentException("Nenhum musica foi localizada.");

        if (type.equals("word")){
            List<CardWord> cards = new ArrayList<>();
            for (CardWord card : fndText.getWordCards()){
                if (LocalDateTime.now().isAfter(card.getLibertyDate())){
                    cards.add(card);
                };
            };
            textRet.setWordCards(cards);
        }
        if (type.equals("phrase")) {
            List<CardPhrase> cards = new ArrayList<>();
            for (CardPhrase card : fndText.getPhraseCards()){
                if (LocalDateTime.now().isAfter(card.getLibertyDate())){
                    cards.add(card);
                };
            };
            textRet.setPhraseCards(cards);
        }

        return textRet;
    }

    @Override
    public Object getCard(String cardId, String type) {

        if (type.equals("word")){
            CardWord cardWord = cardWordRepository.findById(Integer.parseInt(cardId)).get();

            if (cardWord != null)
                return cardWord;
        }
        if (type.equals("phrase")) {
            CardPhrase cardPhrase = cardPhraseRepository.findById(Integer.parseInt(cardId)).get();

            if (cardPhrase != null)
                return cardPhrase;

        }

        throw new IllegalArgumentException("Nenhum musica foi localizada.");
    }

    @Override
    public boolean answerCard(CardAnswerDTO cardAnswerDTO) {

        if (cardAnswerDTO.getType().equals("word")){
            CardWord cardWord = cardWordRepository.findById(Integer.parseInt(cardAnswerDTO.getCardId())).get();

            if (cardWord != null){
                int multiplier = cardWord.getMultiplier();

                if (cardAnswerDTO.isAnswer()){
                    if (multiplier < 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(1));
                    if (multiplier == 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(7));
                    if (multiplier > 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(multiplier));
                    cardWord.setMultiplier(calculateMultiplier(multiplier, cardAnswerDTO.isAnswer()));
                    cardWordRepository.save(cardWord);
                    return true;
                }
                if (!cardAnswerDTO.isAnswer()){
                    if (multiplier < 1) return false;
                    multiplier = calculateMultiplier(multiplier, cardAnswerDTO.isAnswer());
                    cardWord.setMultiplier(multiplier);
                    if (multiplier < 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(1));
                    if (multiplier == 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(7));
                    if (multiplier > 1) cardWord.setLibertyDate(LocalDateTime.now().plusDays(multiplier));
                    cardWordRepository.save(cardWord);
                    return true;
                }
            }
        }
        if (cardAnswerDTO.getType().equals("phrase")) {
            CardPhrase cardPhrase = cardPhraseRepository.findById(Integer.parseInt(cardAnswerDTO.getCardId())).get();

            if (cardPhrase != null) {
                int multiplier = cardPhrase.getMultiplier();

                if (cardAnswerDTO.isAnswer()){
                    if (multiplier < 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(1));
                    if (multiplier == 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(7));
                    if (multiplier > 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(multiplier));
                    cardPhrase.setMultiplier(calculateMultiplier(multiplier, cardAnswerDTO.isAnswer()));
                    cardPhraseRepository.save(cardPhrase);
                    return true;
                }
                if (!cardAnswerDTO.isAnswer()){
                    if (multiplier < 1) return false;
                    multiplier = calculateMultiplier(multiplier, cardAnswerDTO.isAnswer());
                    cardPhrase.setMultiplier(multiplier);
                    if (multiplier < 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(1));
                    if (multiplier == 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(7));
                    if (multiplier > 1) cardPhrase.setLibertyDate(LocalDateTime.now().plusDays(multiplier));
                    cardPhraseRepository.save(cardPhrase);
                    return true;
                }
            }

        }

        throw new IllegalArgumentException("Nenhum card foi localizada.");
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

    int calculateMultiplier(int multiplier, boolean answer) {
        if (answer){
            if (multiplier < 1) return 1;
            if (multiplier == 1) return 7;
            if (multiplier > 1) return multiplier * 2;
        }
        if (answer){
            if (multiplier < 1) return multiplier;
            if (multiplier == 1) return 0;
            if (multiplier > 1) return 1;
        }
        return multiplier;
    }


}
