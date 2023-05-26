// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  Computed<int>? _$StatusCodeComputed;

  @override
  int get StatusCode =>
      (_$StatusCodeComputed ??= Computed<int>(() => super.StatusCode,
              name: 'ControllerBase.StatusCode'))
          .value;
  Computed<bool>? _$loadinggComputed;

  @override
  bool get loadingg => (_$loadinggComputed ??=
          Computed<bool>(() => super.loadingg, name: 'ControllerBase.loadingg'))
      .value;
  Computed<List<dynamic>>? _$resultadoPartOfSpeechComputed;

  @override
  List<dynamic> get resultadoPartOfSpeech =>
      (_$resultadoPartOfSpeechComputed ??= Computed<List<dynamic>>(
              () => super.resultadoPartOfSpeech,
              name: 'ControllerBase.resultadoPartOfSpeech'))
          .value;
  Computed<List<dynamic>>? _$resultadoMeaningsComputed;

  @override
  List<dynamic> get resultadoMeanings => (_$resultadoMeaningsComputed ??=
          Computed<List<dynamic>>(() => super.resultadoMeanings,
              name: 'ControllerBase.resultadoMeanings'))
      .value;
  Computed<List<dynamic>>? _$resultadoEtymologyComputed;

  @override
  List<dynamic> get resultadoEtymology => (_$resultadoEtymologyComputed ??=
          Computed<List<dynamic>>(() => super.resultadoEtymology,
              name: 'ControllerBase.resultadoEtymology'))
      .value;

  late final _$JsonAtom = Atom(name: 'ControllerBase.Json', context: context);

  @override
  List<dynamic> get Json {
    _$JsonAtom.reportRead();
    return super.Json;
  }

  @override
  set Json(List<dynamic> value) {
    _$JsonAtom.reportWrite(value, super.Json, () {
      super.Json = value;
    });
  }

  late final _$partOfSpeechAtom =
      Atom(name: 'ControllerBase.partOfSpeech', context: context);

  @override
  List<dynamic> get partOfSpeech {
    _$partOfSpeechAtom.reportRead();
    return super.partOfSpeech;
  }

  @override
  set partOfSpeech(List<dynamic> value) {
    _$partOfSpeechAtom.reportWrite(value, super.partOfSpeech, () {
      super.partOfSpeech = value;
    });
  }

  late final _$meaningsAtom =
      Atom(name: 'ControllerBase.meanings', context: context);

  @override
  List<dynamic> get meanings {
    _$meaningsAtom.reportRead();
    return super.meanings;
  }

  @override
  set meanings(List<dynamic> value) {
    _$meaningsAtom.reportWrite(value, super.meanings, () {
      super.meanings = value;
    });
  }

  late final _$meanings_obsAtom =
      Atom(name: 'ControllerBase.meanings_obs', context: context);

  @override
  List<dynamic> get meanings_obs {
    _$meanings_obsAtom.reportRead();
    return super.meanings_obs;
  }

  @override
  set meanings_obs(List<dynamic> value) {
    _$meanings_obsAtom.reportWrite(value, super.meanings_obs, () {
      super.meanings_obs = value;
    });
  }

  late final _$etymologyAtom =
      Atom(name: 'ControllerBase.etymology', context: context);

  @override
  List<dynamic> get etymology {
    _$etymologyAtom.reportRead();
    return super.etymology;
  }

  @override
  set etymology(List<dynamic> value) {
    _$etymologyAtom.reportWrite(value, super.etymology, () {
      super.etymology = value;
    });
  }

  late final _$statusCodeAtom =
      Atom(name: 'ControllerBase.statusCode', context: context);

  @override
  int get statusCode {
    _$statusCodeAtom.reportRead();
    return super.statusCode;
  }

  @override
  set statusCode(int value) {
    _$statusCodeAtom.reportWrite(value, super.statusCode, () {
      super.statusCode = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$palavraAtom =
      Atom(name: 'ControllerBase.palavra', context: context);

  @override
  String get palavra {
    _$palavraAtom.reportRead();
    return super.palavra;
  }

  @override
  set palavra(String value) {
    _$palavraAtom.reportWrite(value, super.palavra, () {
      super.palavra = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('ControllerBase.pesquisar', context: context);

  @override
  Future<List<dynamic>> pesquisar(String value) {
    return _$pesquisarAsyncAction.run(() => super.pesquisar(value));
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setPalavra(String value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPalavra');
    try {
      return super.setPalavra(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
Json: ${Json},
partOfSpeech: ${partOfSpeech},
meanings: ${meanings},
meanings_obs: ${meanings_obs},
etymology: ${etymology},
statusCode: ${statusCode},
loading: ${loading},
palavra: ${palavra},
StatusCode: ${StatusCode},
loadingg: ${loadingg},
resultadoPartOfSpeech: ${resultadoPartOfSpeech},
resultadoMeanings: ${resultadoMeanings},
resultadoEtymology: ${resultadoEtymology}
    ''';
  }
}
