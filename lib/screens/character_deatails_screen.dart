import 'package:flutter/material.dart';

import 'package:breaking_bad/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  Widget buildSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      floating: false,
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
                  height: 400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
