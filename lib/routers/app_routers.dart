import '../apis/character_api.dart';
import '../cubit/characters_cubit.dart';
import '../models/characters.dart';
import '../repository/characte_repository.dart';
import '../screens/character_deatails_screen.dart';
import '../screens/character_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharactersApi());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case '/details':
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) =>
                CharactersCubit(characterRepository),
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
    return null;
  }
}
