import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = "Loading...";

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(
        "Kathmandu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJixiedOgNkaJty0V1GlSqSls90lqdlaBDiw&usqp=CAU",
        "Asia/Kathmandu");

    await worldTime.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": worldTime.location,
      "time": worldTime.time,
      "flag":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJixiedOgNkaJty0V1GlSqSls90lqdlaBDiw&usqp=CAU",
      "isDayTime" : worldTime.isDay
    });
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
          child: SpinKitCircle(
            color: Colors.red,
            size: 50.0,
          ),
        )
    );
  }
}
