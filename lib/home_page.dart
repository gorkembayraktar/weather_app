import 'package:flutter/material.dart';
import 'package:havadurumu/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Clear.jpg'), fit: BoxFit.cover),
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "20° C",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ankara",
                      style: TextStyle(fontSize: 30),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchPage()));
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
