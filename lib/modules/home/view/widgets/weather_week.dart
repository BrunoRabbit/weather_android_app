import 'package:flutter/material.dart';

class WeatherWeek extends StatelessWidget {
  const WeatherWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: 6,
        itemExtent: 65,
        itemBuilder: (context, index) {
          return Row(
            children: const [
              Text('Monday'),
              Spacer(),
              Text('23°'),
              SizedBox(width: 6),
              Icon(Icons.sunny),
            ],
          );
        },
      ),
    );
  }
}
