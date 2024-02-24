import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:havadurumu/search_page.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});
  final String title;

  static String APIKEY = '2ad7faa3104a0b4cb2194b48271efb45';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = 'Bursa';
  double? temperature;


  var locationData;

  Future<void> getLocationData() async {
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=${MyHomePage.APIKEY}&units=metric'));
    final locationDataParsed = jsonDecode(locationData.body);

    setState(() {
      temperature = locationDataParsed['main']['temp'];
      location = locationDataParsed['name'];
    });
  }

  @override
  void initState() {
    print('init state');
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Clear.jpg'), fit: BoxFit.cover),
      ),
      child: (temperature == null)
          ? const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballGridPulse,

                        /// Required, The loading type of the widget
                        colors: const [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple,
                        ],

                        /// Optional, The color collections
                        strokeWidth: 2,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        backgroundColor: Colors.transparent,

                        /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black

                        /// Optional, the stroke backgroundColor
                        ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Veri getiriliyor..',
                        style: TextStyle(
                            fontSize: 33, color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              )),
            )
          : Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$temperature° C",
                        style: const TextStyle(
                            fontSize: 70, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            location,
                            style: TextStyle(fontSize: 30),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              temperature = null;
                              final selectedCity = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                                location = selectedCity;
                                getLocationData();
                            },
                          )
                        ],
                      )
                    ]),
              ),
            ),
    );
  }
}
