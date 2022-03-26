import 'package:breaking_bad/models/characters.dart';

import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/details', arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: character.img.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading-loop.gif',
                      image: character.img,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/loading-loop.gif'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Theme.of(context).primaryColorDark.withOpacity(.5),
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
