// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_SplashControllerBase.isLoading');

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

  final _$isLoggedAtom = Atom(name: '_SplashControllerBase.isLogged');

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

  final _$errorMessageAtom = Atom(name: '_SplashControllerBase.errorMessage');

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

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction(
        name: '_SplashControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction(
        name: '_SplashControllerBase._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLogged: ${isLogged},
errorMessage: ${errorMessage}
    ''';
  }
}
