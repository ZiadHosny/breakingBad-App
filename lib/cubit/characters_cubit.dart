import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/characters.dart';
import '../repository/characte_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  List<String> quotes = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacter().then((characters) {
      emit(CharactersLoaded(characters));

      this.characters = characters;
    });
    return characters;
  }

  List<String> getAllQuotesByCharacter(String name) {
    characterRepository.getAllQuotesByCharacter(name).then((value) {
      for (var oneQuote in value) {
        quotes.add(oneQuote.quote);
      }
      emit(QuotesLoaded(quotes));
    });

    return quotes;
  }
}
