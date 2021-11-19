import 'package:mobx/mobx.dart';
import 'package:murieta/Data/repositories/auth.repository.dart';
import 'package:murieta/Data/source/local_storage.source.dart';
import 'package:murieta/Domain/model/auth/login.dart';
import 'package:murieta/Domain/model/auth/user.model.dart';
import 'package:murieta/Domain/model/response_model.dart';

part 'auth.service.g.dart';

class AuthService = _AuthServiceBase with _$AuthService;


abstract class _AuthServiceBase with Store {
  @observable
  UserModel currentUser = UserModel();

  @action
  setCurrentUser(UserModel value) => currentUser = value;

  final _authrepository = AuthRepository();

  Future<ResponseModel> login({required LoginDTO signInDto}) async {
    ResponseModel responseModel = await _authrepository.signIn(signInDto: signInDto);

    LocalStorageSource.setString(LocalStorageKeys.access_token, responseModel.data.access_token);
    LocalStorageSource.setString(LocalStorageKeys.me, responseModel.data.me);

    setCurrentUser(responseModel.data.me);

    return responseModel;
  }
  
}