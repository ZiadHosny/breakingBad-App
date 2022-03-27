// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/cubit/characters_cubit.dart';

import 'package:flutter/material.dart';

import 'package:breaking_bad/models/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  List<String> quotes = [];

  Widget buildLoadedQuote(List<String> quotes, context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorLight,
              shadows: [
                Shadow(
                  blurRadius: 7,
                  color: Theme.of(context).primaryColor,
                )
              ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: quotes
                .map(
                  (e) => FlickerAnimatedText(e,
                      textAlign: TextAlign.center,
                      speed: const Duration(
                        seconds: 3,
                      )),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget buildBlocWidget(ctx) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is QuotesLoaded) {
          quotes = (state).quotes;
          quotes.shuffle();
          if (quotes.isEmpty) {
            return const SizedBox();
          }
          return buildLoadedQuote(quotes, ctx);
        } else {
          return showLoadingIndicator(ctx);
        }
      },
    );
  }

  Widget showLoadingIndicator(context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColorDark,
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }

  Widget buildSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      floating: false,
      snap: false,
      backgroundColor: Theme.of(context).primaryColorDark,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName,
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value, context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent, context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Theme.of(context).primaryColorDark,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context)
        .getAllQuotesByCharacter(character.name);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      characterInfo(
                          'Job : ', character.occupation.join(' / '), context),
                      buildDivider(315, context),
                      characterInfo(
                          'Appeared in : ', character.category, context),
                      buildDivider(250, context),
                      characterInfo('Seasons : ',
                          character.appearance.join(' / '), context),
                      buildDivider(280, context),
                      characterInfo('Status : ', character.status, context),
                      buildDivider(300, context),
                      character.better_call_saul_appearance.isEmpty
                          ? Container()
                          : characterInfo(
                              'Better Call Saul Seasons : ',
                              character.better_call_saul_appearance.join(" / "),
                              context),
                      character.better_call_saul_appearance.isEmpty
                          ? Container()
                          : buildDivider(150, context),
                      characterInfo(
                          'Actor/Actress : ', character.portrayed, context),
                      buildDivider(235, context),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                buildBlocWidget(context),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
