import 'package:bloc/bloc.dart';
import 'package:breaking_bad/models/characters.dart';
import 'package:breaking_bad/repository/characte_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacter().then((characters) {
      emit(CharactersLoaded(characters));

      this.characters = characters;
    });
    return characters;
  }
}
