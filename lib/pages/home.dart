import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String image = data['isDayTime'] ? 'day.png' : 'night.png';
    Color safeAReaColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: safeAReaColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/$image"), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    new CircularProgressIndicator();
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data["location"],
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data["time"],
                  style: TextStyle(color: Colors.white, fontSize: 54),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(data["flag"]),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/albumActivity');
                    },
                    child: Text("Click me"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
