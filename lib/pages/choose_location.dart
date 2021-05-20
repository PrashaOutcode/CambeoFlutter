import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> worldTimes = [
    WorldTime(
        "Africa",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEVJztfQWRjQ8z7mrLPkd0-asHfuBdQ6dAWQ&usqp=CAU",
        "Africa/Abidjan"),
    WorldTime(
        "America",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuO2fGvfhA1dP0fFNh2z3lUT67yw_rG8V26Q&usqp=CAU",
        "America/Anchorage"),
    WorldTime(
        "Singapore",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbtJ0yGZFxJ6e-TMjXc2-viLf63vcCWXCGfg&usqp=CAU",
        "Asia/Singapore"),
    WorldTime(
        "Kathmandu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJixiedOgNkaJty0V1GlSqSls90lqdlaBDiw&usqp=CAU",
        "Asia/Kathmandu"),
    WorldTime(
        "Pacific",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbf5jDumqJuiDsnK9KbELlv4-hPPKMjA-t-g&usqp=CAU",
        "Pacific/Nauru"),
  ];

  void updateLocation(int index) async {
    WorldTime selectedTime = worldTimes[index];
    await selectedTime.getData();
    Navigator.pop(context, {
      "location": selectedTime.location,
      "time": selectedTime.time,
      "flag": selectedTime.countryFlag,
      "isDayTime": selectedTime.isDay
    });
  }

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print("hello world");
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                backgroundColor: Colors.red,
              ),
            ),
          )
        : Stack(children: <Widget>[
            Scaffold(
                backgroundColor: Colors.grey.shade200,
                appBar: AppBar(
                  title: Text("Choose a Location"),
                  centerTitle: true,
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.all(12),
                      child: ListTile(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                            updateLocation(index);
                          },
                          title: Text(worldTimes[index].location),
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(worldTimes[index].countryFlag),
                          )),
                    );
                  },
                  itemCount: worldTimes.length,
                ))
          ]);
  }
}
