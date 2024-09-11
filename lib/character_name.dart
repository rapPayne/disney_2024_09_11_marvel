import 'package:flutter/material.dart';
import 'business_classes.dart';

class CharacterName extends StatelessWidget {
  final Result character;
  const CharacterName({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          '${character.thumbnail?.path}.${character.thumbnail?.extension}',
          width: 100,
        ),
        Text(
          character.name ?? "",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
