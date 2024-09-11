import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_character_lookup/character_name.dart';
import 'package:marvel_character_lookup/data_tools/repository.dart';
import 'business_classes.dart';

class CharacterLookup extends StatefulWidget {
  const CharacterLookup({super.key});

  @override
  State<CharacterLookup> createState() => _CharacterLookupState();
}

class _CharacterLookupState extends State<CharacterLookup> {
  List<Result> _characterList = [];
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    String marvelApiKey = dotenv.env['MARVEL_API_KEY'] ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Lookup"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (val) {
              _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                fetchCharacters(searchString: val, apiKey: marvelApiKey).then(
                    (chars) => setState(() => _characterList = chars ?? []));
              });
            },
          ),
          Expanded(
            child: ListView(
              children: _characterList.map((character) {
                return CharacterName(character: character);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
