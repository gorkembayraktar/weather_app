import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/search.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
      ),
        body: const Center(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Şehiri seçiniz', border: OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )

              ]),
        ),
      ),
    );
  }
}
