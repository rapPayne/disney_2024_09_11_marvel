import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:marvel_character_lookup/business_classes.dart';

Future<List<Result>?> fetchCharacters(
    {String searchString = "", String apiKey = ""}) {
  assert(apiKey.isNotEmpty, "Must have an API key. Check your .env file");
  String url =
      'https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=$searchString&apikey=$apiKey';
  return get(Uri.parse(url))
      .then((res) {
        if (res.statusCode > 399) {
          debugPrint("Status code: ${res.statusCode}");
          throw Exception(
              "Error fetching. Error code is ${res.statusCode} and body is '${res.body}'");
        }
        return res;
      })
      .then((res) => json.decode(res.body))
      .then((res) => Welcome.fromJson(res))
      //.then((res) => res["data"]["results"])
      .then((welcome) => welcome.data)
      .then((data) => data!.results)
      //.then((res) => res.map((c) => c as Map<String, dynamic>).toList())
      .catchError((err) => throw ('Problem fetching characters: $err'));
}

Future fetchComicsForCharacter({required int characterId}) {
  String marvelApiKey = dotenv.env['MARVEL_API_KEY'] ?? "";

  String url =
      'https://gateway.marvel.com:443/v1/public/characters/$characterId/comics?limit=100&orderBy=onsaleDate&apikey=$marvelApiKey';
  return get(Uri.parse(url))
      .then((res) {
        if (res.statusCode > 399) {
          throw Exception('Problem with fetch: ${res.statusCode}');
        }
        return res;
      })
      .then((res) => json.decode(res.body))
      .then((res) => res["data"])
      .then((res) => res["results"] as List)
      .then((List<dynamic> comics) =>
          comics.map((c) => c as Map<String, dynamic>).toList());
}
