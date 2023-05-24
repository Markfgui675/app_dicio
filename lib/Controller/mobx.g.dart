// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  Computed<List<dynamic>>? _$resultadoComputed;

  @override
  List<dynamic> get resultado =>
      (_$resultadoComputed ??= Computed<List<dynamic>>(() => super.resultado,
              name: 'ControllerBase.resultado'))
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
palavra: ${palavra},
resultado: ${resultado}
    ''';
  }
}
