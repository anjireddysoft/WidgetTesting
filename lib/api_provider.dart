import 'dart:convert';

import 'package:flutter_test_practice/album_model.dart';
import 'package:http/http.dart';
class ApiProvider{
  var client = Client();
  Future<List<Album>> fetchAlbum() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
   Iterable list= json.decode(response.body);
   return list.map((e) => Album.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}