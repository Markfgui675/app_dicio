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
  List<dynamic> sinonimos = [];

  @observable
  List<dynamic> frases = [];

  @observable
  List<dynamic> partOfSpeech = [].asObservable();

  @observable
  List<dynamic> meanings= [].asObservable();
  @observable
  List<dynamic> meanings_obs = [].asObservable();

  @observable
  List<dynamic> etymology = [].asObservable();

  @observable
  int statusCode = 0;






  @action
  Future<List<dynamic>> pesquisar(String value, String tipo) async {

    Json.clear();

    String palavra = value;
    var url;

    if(tipo == 'significados'){
      url = Uri.parse(
          'https://dicio-api-ten.vercel.app/v2/$palavra'
      );
    } else if(tipo == 'sinonimos'){
      url = Uri.parse(
          'https://dicio-api-ten.vercel.app/v2/sinonimos/$palavra'
      );
    } else if(tipo == 'frases'){
      url = Uri.parse(
          'https://dicio-api-ten.vercel.app/v2/frases/$palavra'
      );
    }

    var response = await http.get(url);

    print(response.statusCode);

    if(response.statusCode != 200){
      statusCode = response.statusCode;
    }

    if(response.statusCode == 200){
      statusCode = 200;
      print(json.decode(response.body));
      Json = json.decode(response.body);

      sinonimos.clear();
      frases.clear();
      partOfSpeech.clear();
      meanings_obs.clear();
      meanings.clear();
      etymology.clear();

      if(tipo == 'significados'){
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
      } else if(tipo == 'sinonimos'){
        for(int l = 0; l < Json.length; l++){
          sinonimos.add(Json[l]);
        }
      } else if(tipo == 'frases'){

      }


      return Json;
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }






  @computed
  int get StatusCode{
    return statusCode;
  }

  @computed
  List<dynamic> get resultadoSinonimos{
    return sinonimos;
  }

  @computed
  List<dynamic> get resultadoFrases{
    return frases;
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
