import 'package:flutter/cupertino.dart';

import '../repository/personagem_repository.dart';
import '../models/personagem.dart';

class PersonagemController{
  PersonagemRepository repository;
  PersonagemController({required this.repository});

  Future<List<Personagem>> getAPI() async {
    try {
      final response = await repository.getResult();
      return response;
    } catch(e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}