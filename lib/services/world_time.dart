import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:world_time/response/TimeResponse.dart';


/*Future<TimeResponse> fetchTime(String url) async {
  final response = await get("https://worldtimeapi.org/api/timezone/$url");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return TimeResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/



class WorldTime {
  String location;
  String time;
  String countryFlag;
  String url;
  bool isDay;

  WorldTime(this.location, this.countryFlag, this.url);

  Future<void> getData() async {
    try {
      Response response =
          await get("https://worldtimeapi.org/api/timezone/$url");

      if (response.statusCode == 200) {
        Map dateData = jsonDecode(response.body);
        String dateTime = dateData['utc_datetime'];
        String hour = dateData['utc_offset'].toString().substring(1, 3);
        String minute = dateData['utc_offset'].toString().substring(4, 6);
        DateTime date = DateTime.parse(dateTime);
        date = date.add(Duration(hours: int.parse(hour)));
        date = date.add(Duration(minutes: int.parse(minute)));
        isDay = date.hour > 6 && date.hour < 18 ? true : false;
        time = DateFormat.jm().format(date);
      } else {

      }
    } catch (e) {
      print("causedError:$e");
      time = "Could not get time";
    }
  }
}
