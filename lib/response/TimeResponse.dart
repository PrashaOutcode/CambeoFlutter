class TimeResponse {
    String abbreviation;
    String client_ip;
    String datetime;
    int day_of_week;
    int day_of_year;
    bool dst;
    int dst_offset;
    int raw_offset;
    String timezone;
    int unixtime;
    String utc_datetime;
    String utc_offset;
    int week_number;

    TimeResponse({this.abbreviation, this.client_ip, this.datetime, this.day_of_week, this.day_of_year, this.dst, this.dst_offset, this.raw_offset, this.timezone, this.unixtime, this.utc_datetime, this.utc_offset, this.week_number});

    factory TimeResponse.fromJson(Map<String, dynamic> json) {
        return TimeResponse(
            abbreviation: json['abbreviation'], 
            client_ip: json['client_ip'], 
            datetime: json['datetime'], 
            day_of_week: json['day_of_week'], 
            day_of_year: json['day_of_year'], 
            dst: json['dst'], 
            dst_offset: json['dst_offset'], 
            raw_offset: json['raw_offset'], 
            timezone: json['timezone'], 
            unixtime: json['unixtime'], 
            utc_datetime: json['utc_datetime'], 
            utc_offset: json['utc_offset'], 
            week_number: json['week_number'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['abbreviation'] = this.abbreviation;
        data['client_ip'] = this.client_ip;
        data['datetime'] = this.datetime;
        data['day_of_week'] = this.day_of_week;
        data['day_of_year'] = this.day_of_year;
        data['dst'] = this.dst;
        data['dst_offset'] = this.dst_offset;
        data['raw_offset'] = this.raw_offset;
        data['timezone'] = this.timezone;
        data['unixtime'] = this.unixtime;
        data['utc_datetime'] = this.utc_datetime;
        data['utc_offset'] = this.utc_offset;
        data['week_number'] = this.week_number;
        return data;
    }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:world_time/model/WorldTime.dart';
import 'package:world_time/response/TimeResponse.dart';
import 'package:world_time/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = "Loading...";
  WorldTime worldTime;
  Future<TimeResponse> response;

  void setUpWorldTime() async {
    worldTime = WorldTime(
        "Kathmandu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJixiedOgNkaJty0V1GlSqSls90lqdlaBDiw&usqp=CAU",
        "Asia/Kathmandu");
    response = fetchTime(worldTime.location);
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        body: Center(
            child: FutureBuilder<TimeResponse>(
                future: response,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("data:${snapshot.data.datetime}");
                    DateTime date = DateTime.parse(snapshot.data.datetime);
                    String time = DateFormat.jm().format(date);

                    Navigator.pushReplacementNamed(context, '/home',
                        arguments: {
                          "location": worldTime.location,
                          "time": time,
                          "flag": worldTime.image,
                          "isDayTime":
                          date.hour > 6 && date.hour < 18 ? true : false
                        });
                    return Scaffold(appBar: AppBar(),);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return SpinKitCircle(
                    color: Colors.red,
                    size: 50.0,
                  );
                })));
  }
}

*/