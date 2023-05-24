import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'mobx.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {

  @observable
  List<dynamic> Json = [];

  @action
  Future<List<dynamic>> pesquisar(String value) async {

    Json.clear();

    String palavra = value;
    var url = Uri.parse(
        'https://dicio-api-ten.vercel.app/v2/$palavra'
    );
    var response = await http.get(url);
    print(response.statusCode);

    if(response.statusCode == 200){
      print(json.decode(response.body));
      Json = json.decode(response.body);
      return Json;
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }

  }

  @computed
  List<dynamic> get resultado{
    return Json;
  }

  @observable
  String palavra = '';
  @action
  setPalavra(String value){
    palavra = value;
  }

}
