import 'package:get_it/get_it.dart';
import 'package:murieta/Domain/service/auth.service.dart';

GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  //Services
  serviceLocator.registerSingleton<AuthService>(new AuthService());
}