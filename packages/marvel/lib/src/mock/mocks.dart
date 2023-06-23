// ignore_for_file: public_member_api_docs

import 'package:marvel/src/domain/entities/character.dart';
import 'package:marvel/src/infraestructure/models/character_model.dart';

const paginationResponseJson = {'offset': 0, 'limit': 20, 'total': 1562, 'count': 20, 'results': []};

const marvelResponse = {
  'code': 200,
  'status': 'Ok',
  'copyright': '© 2023 MARVEL',
  'attributionText': 'Data provided by Marvel. © 2023 MARVEL',
  'attributionHTML': 'Test',
  'etag': 'a29d903f304d85ecd638f8e7c3055dfd366108a0',
  'data': paginationResponseJson
};

const characterJson1 = {
  'id': 1011334,
  'name': '3-D Man',
  'description': '',
  'modified': '2014-04-29T14:18:17-0400',
  'thumbnail': {'path': 'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784', 'extension': 'jpg'}
};
final characterModel1Mock = CharacterModel.fromJson(characterJson1);

final characterEntity = Character(
  id: 1,
  name: 'name',
  description: 'description',
  modified: DateTime.now(),
  thumbnail: 'thumbnail',
);

Map<String, dynamic> simulateMarvelResponse(dynamic data) {
  return {
    ...marvelResponse,
    'data': {...paginationResponseJson, 'results': data}
  };
}
