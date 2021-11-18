// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_LoginControllerBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$passwordHiddenAtom =
      Atom(name: '_LoginControllerBase.passwordHidden');

  @override
  bool get passwordHidden {
    _$passwordHiddenAtom.reportRead();
    return super.passwordHidden;
  }

  @override
  set passwordHidden(bool value) {
    _$passwordHiddenAtom.reportWrite(value, super.passwordHidden, () {
      super.passwordHidden = value;
    });
  }

  final _$passwordIconAtom = Atom(name: '_LoginControllerBase.passwordIcon');

  @override
  Icon get passwordIcon {
    _$passwordIconAtom.reportRead();
    return super.passwordIcon;
  }

  @override
  set passwordIcon(Icon value) {
    _$passwordIconAtom.reportWrite(value, super.passwordIcon, () {
      super.passwordIcon = value;
    });
  }

  final _$loginDTOAtom = Atom(name: '_LoginControllerBase.loginDTO');

  @override
  LoginDTO get loginDTO {
    _$loginDTOAtom.reportRead();
    return super.loginDTO;
  }

  @override
  set loginDTO(LoginDTO value) {
    _$loginDTOAtom.reportWrite(value, super.loginDTO, () {
      super.loginDTO = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login({required BuildContext context}) {
    return _$loginAsyncAction.run(() => super.login(context: context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeShowPassword({required BuildContext context}) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeShowPassword');
    try {
      return super.changeShowPassword(context: context);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLogged: ${isLogged},
errorMessage: ${errorMessage},
passwordHidden: ${passwordHidden},
passwordIcon: ${passwordIcon},
loginDTO: ${loginDTO}
    ''';
  }
}
