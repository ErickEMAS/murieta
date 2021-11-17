// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words.controler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordsController on _WordsControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_WordsControllerBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_WordsControllerBase.errorMessage');

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

  final _$wordsAtom = Atom(name: '_WordsControllerBase.words');

  @override
  List<dynamic> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(List<dynamic> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  final _$_WordsControllerBaseActionController =
      ActionController(name: '_WordsControllerBase');

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_WordsControllerBaseActionController.startAction(
        name: '_WordsControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_WordsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_WordsControllerBaseActionController.startAction(
        name: '_WordsControllerBase._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_WordsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
words: ${words}
    ''';
  }
}
