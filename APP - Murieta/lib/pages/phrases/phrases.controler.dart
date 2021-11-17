import 'package:mobx/mobx.dart';

part 'phrases.controler.g.dart';

class PhrasesController = _PhrasesControllerBase with _$PhrasesController;

abstract class _PhrasesControllerBase with Store {

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  @observable
  List phrases = [["As we cry in our winter days", "As we cry our way down the street", "As you remember all autumn day so bright", "As you remember the spring day so bright", "As you remember the summer day so bright", "As you remember the summer day so bright"], ["Beyond the clouds"], ["Happiness may seem just out of sight"], ["Lonely night"], ];
  
  @action
  setLoading(bool value) => isLoading = value;

  @action
  _setErrorMessage(String value) => errorMessage = value;

}