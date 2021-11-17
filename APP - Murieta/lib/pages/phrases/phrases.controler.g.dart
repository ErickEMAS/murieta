// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrases.controler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhrasesController on _PhrasesControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_PhrasesControllerBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_PhrasesControllerBase.errorMessage');

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

  final _$phrasesAtom = Atom(name: '_PhrasesControllerBase.phrases');

  @override
  List<dynamic> get phrases {
    _$phrasesAtom.reportRead();
    return super.phrases;
  }

  @override
  set phrases(List<dynamic> value) {
    _$phrasesAtom.reportWrite(value, super.phrases, () {
      super.phrases = value;
    });
  }

  final _$_PhrasesControllerBaseActionController =
      ActionController(name: '_PhrasesControllerBase');

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_PhrasesControllerBaseActionController.startAction(
        name: '_PhrasesControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_PhrasesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_PhrasesControllerBaseActionController.startAction(
        name: '_PhrasesControllerBase._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_PhrasesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
phrases: ${phrases}
    ''';
  }
}
