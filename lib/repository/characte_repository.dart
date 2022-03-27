import '../apis/character_api.dart';
import '../models/characters.dart';
import '../models/quote.dart';

class CharacterRepository {
  final CharactersApi charApi;

  CharacterRepository(this.charApi);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charApi.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getAllQuotesByCharacter(String name) async {
    final quotes = await charApi.getAllQuotes(name);

    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
