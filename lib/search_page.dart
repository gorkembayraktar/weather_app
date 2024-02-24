import 'package:flutter/material.dart';
import 'package:havadurumu/home_page.dart';
import 'package:havadurumu/utils.dart';
import 'package:http/http.dart' as http;
class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCity = '';

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
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    onChanged: (value) {
                      selectedCity = value;
                    },
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Şehiri seçiniz',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async{

                      http.Response response  = await http.get(Uri.parse(
                          'https://api.openweathermap.org/data/2.5/weather?q=$selectedCity&appid=${MyHomePage.APIKEY}&units=metric'));
                      if(response.statusCode == 200){
                        return Navigator.pop(context, selectedCity);
                      }
                      snackbarShow(context, 'Aradığınız şehir bulunamadı');
                    },
                    child: const Text('Seç')
                )
              ]),
        ),
      ),
    );
  }
}
