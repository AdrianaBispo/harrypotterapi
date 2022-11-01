import 'dart:collection';

import 'package:http/http.dart' as http;
import '../models/personagem.dart';
import 'dart:convert';

class PersonagemRepository {
  Future/*<List<Personagem>>*/ getResult() async {
    var url = Uri.https('hp-api.herokuapp.com', '/api/characters');

    var response = await http.get(url);
    Iterable data = jsonDecode(response.body);

    final listaPersonagens = data.map((e) => Personagem.fromJson(e)).toList();

    return  listaPersonagens;
  }
}
