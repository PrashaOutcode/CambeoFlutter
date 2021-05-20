import 'package:world_time/response/Album.dart';
import 'dart:convert';
import 'package:http/http.dart';

Future<Album> fetchAlbum() async {
  final response =
  await get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}