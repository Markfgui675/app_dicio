import 'dart:convert';
import 'package:app_dicio/View/design/semResultado.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'mobx.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {

  @observable
  List<dynamic> Json = [];

  @observable
  List<dynamic> partOfSpeech = [].asObservable();

  @observable
  List<dynamic> meanings= [].asObservable();
  @observable
  List<dynamic> meanings_obs = [].asObservable();

  @observable
  List<dynamic> etymology = [].asObservable();

  @action
  Widget

  @action
  Future<List<dynamic>> pesquisar(String value) async {

    Json.clear();

    String palavra = value;
    var url = Uri.parse(
        'https://dicio-api-ten.vercel.app/v2/$palavra'
    );
    var response = await http.get(url);
    print(response.statusCode);

    if(response.statusCode != 200){
      semResultado();
    }

    if(response.statusCode == 200){
      print(json.decode(response.body));
      Json = json.decode(response.body);

      partOfSpeech.clear();
      meanings_obs.clear();
      meanings.clear();
      etymology.clear();

      for(int l = 0; l < Json.length; l++){
        partOfSpeech.add(Json[l]['partOfSpeech']);
        meanings_obs.add(Json[l]['meanings']);
        etymology.add(Json[l]['etymology']);
      }

      print(partOfSpeech.toString());
      print(meanings_obs.toString());
      print(etymology.toString());

      for(int l = 0; l < meanings_obs.length; l++){
        meanings.add(meanings_obs[l]);
      }

      print(meanings.toString());

      return Json;
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }

  }

  @computed
  List<dynamic> get resultadoPartOfSpeech{
    return partOfSpeech;
  }

  @computed
  List<dynamic> get resultadoMeanings{
    return meanings;
  }

  @computed
  List<dynamic> get resultadoEtymology{
    return etymology;
  }

  @observable
  String palavra = '';
  @action
  setPalavra(String value){
    palavra = value;
  }

}
