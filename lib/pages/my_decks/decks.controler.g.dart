// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks.controler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DecksController on _DecksControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_DecksControllerBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_DecksControllerBase.errorMessage');

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

  final _$decksAtom = Atom(name: '_DecksControllerBase.decks');

  @override
  List<CoverDeck> get decks {
    _$decksAtom.reportRead();
    return super.decks;
  }

  @override
  set decks(List<CoverDeck> value) {
    _$decksAtom.reportWrite(value, super.decks, () {
      super.decks = value;
    });
  }

  final _$_DecksControllerBaseActionController =
      ActionController(name: '_DecksControllerBase');

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_DecksControllerBaseActionController.startAction(
        name: '_DecksControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DecksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessage(String value) {
    final _$actionInfo = _$_DecksControllerBaseActionController.startAction(
        name: '_DecksControllerBase._setErrorMessage');
    try {
      return super._setErrorMessage(value);
    } finally {
      _$_DecksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchdecks() {
    final _$actionInfo = _$_DecksControllerBaseActionController.startAction(
        name: '_DecksControllerBase.fetchdecks');
    try {
      return super.fetchdecks();
    } finally {
      _$_DecksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
decks: ${decks}
    ''';
  }
}
