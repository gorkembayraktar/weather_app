import 'package:flutter/material.dart';

class CardDailyItem{
  String icon;
  double temperature;
  String date;
  CardDailyItem({required this.icon, required this.temperature, required this.date});
}

class DailyWeatherCard extends StatelessWidget {
  const DailyWeatherCard({super.key, required this.cardDailyItem});

  final CardDailyItem cardDailyItem;

  @override
  Widget build(BuildContext context) {

    List<String> weekdays = [
        'Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'
    ];

    final String newDayText =  weekdays[ DateTime.parse(cardDailyItem.date).weekday - 1 ];

    return  Card(
      color: Colors.transparent,
      elevation: 1,
      child: Container(
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://openweathermap.org/img/wn/${cardDailyItem.icon}@4x.png'),
            Text(
              "${cardDailyItem.temperature}° C",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              newDayText,
              textAlign: TextAlign.center ,
            ),
          ],
        ),
      ),
    );
  }
}
