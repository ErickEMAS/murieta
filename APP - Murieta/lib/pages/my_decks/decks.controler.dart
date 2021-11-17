import 'package:mobx/mobx.dart';
import 'package:murieta/model/Deck/cover_deck.dart';

part 'decks.controler.g.dart';

class DecksController = _DecksControllerBase with _$DecksController;

abstract class _DecksControllerBase with Store {

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  @observable
  List<CoverDeck> decks = [];
  
  @action
  setLoading(bool value) => isLoading = value;

  @action
  _setErrorMessage(String value) => errorMessage = value;

  @action
  fetchdecks() {
    decks.addAll([
      CoverDeck(title: "Olly Murs - Look at the Sky", type: 0), 
      CoverDeck(title: "Céline Dion - All By Mysel", type: 0), 
      CoverDeck(title: "James Michael Tyler, who played Gunther on 'Friends,' has diedl", type: 2),
      CoverDeck(title: "Contrails: How tweaking flight plans can help the climate", type: 2),
      CoverDeck(title: "Hamilton - Burn", type: 0),
      CoverDeck(title: "Olly Murs - Dear Darlin'", type: 0),
      CoverDeck(title: "Olly Murs - Oh My Goodness", type: 0),
      CoverDeck(title: "Look at the skyl", type: 0),
      CoverDeck(title: "Aladdin", type: 1),
      CoverDeck(title: "Brooklyn Nine-Nine S1 E1", type: 1),
      CoverDeck(title: "Molly Russell’s father meets Facebook whistleblower Frances Haugen", type: 2),
    ]);
  }

}