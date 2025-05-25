import 'package:flutter/material.dart';
import 'package:weather_app/components/components.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:intl/intl.dart' as intl;

class Weatherbody extends StatelessWidget {
  const Weatherbody({super.key, required this.model});
  final Weathermodel model;
  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(model.update);

    return Scaffold(
      body: Center(
        child: Container(
           decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
    themeColor(model.text),
    themeColor(model.text)[200]!,
      ],
    ),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defulttext(data: model.Cityname, fSize: 33, fw: FontWeight.w600),
              SizedBox(height: 12),
              defulttext(data: "update at ${intl.DateFormat.Hm().format(parsedDate)}", fSize: 22),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(height: 100, width: 100, "http:${model.image}"),
                  defulttext(data: "${model.temp}", fSize: 44, fw: FontWeight.w700),
                  Column(
                    children: [
                      defulttext(data: "MaxTemp: ${model.Max_temp}"),
                      defulttext(data: "MinTemp: ${model.Min_temp}"),
                    ],
                  ),
                ],
              ),
              defulttext(data: "${model.text}", fSize: 40, fw: FontWeight.w700),
            ],
          ),
        ),
      ),
    );
  }
}
