import 'package:flutter/material.dart';
import 'package:marvel_character_lookup/business_classes.dart';

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    var character = ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            '${character.thumbnail!.path}.${character.thumbnail!.extension}',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0.5,
            child: Text(
              character.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
