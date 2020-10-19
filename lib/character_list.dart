import 'package:basic_flutter_app/character_card.dart';
import 'package:flutter/material.dart';

import 'character_model.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  CharacterList(this.characters);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, int) {
        return new CharacterCard(characters[int]);
      },
    );
  }
}
