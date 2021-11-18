import 'package:mobx/mobx.dart';

part 'words.controler.g.dart';

class WordsController = _WordsControllerBase with _$WordsController;

abstract class _WordsControllerBase with Store {

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  @observable
  List words = [["All", "And", "As", "At", "Autumn", "Away"], ["Beyond", "Blow", "Bright"],];
  
  @action
  setLoading(bool value) => isLoading = value;

  @action
  _setErrorMessage(String value) => errorMessage = value;

}