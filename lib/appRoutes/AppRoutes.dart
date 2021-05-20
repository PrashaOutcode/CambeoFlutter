import 'package:world_time/pages/LoginScreen.dart';
import 'package:world_time/pages/album.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';


class AppRoutes{
  static const String DASHBOARD = '/';

  var appRoutes = {
    '/': (context) => LoginScreen(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/albumActivity': (context) => AlbumActivity()
  };
}

