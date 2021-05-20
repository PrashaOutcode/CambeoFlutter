import 'package:flutter/material.dart';
import 'package:world_time/response/Album.dart';
import 'package:world_time/services/albumApi.dart';

class AlbumActivity extends StatefulWidget {
  const AlbumActivity({Key key}) : super(key: key);

  @override
  _AlbumActivityState createState() => _AlbumActivityState();
}

class _AlbumActivityState extends State<AlbumActivity> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    print("fetchedData:$futureAlbum");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
