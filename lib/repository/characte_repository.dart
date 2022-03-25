import 'package:breaking_bad/apis/character_api.dart';
import 'package:breaking_bad/models/characters.dart';

class CharacterRepository {
  final CharactersApi charApi;

  CharacterRepository(this.charApi);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charApi.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
