import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/components.dart';
import 'package:weather_app/cubit/weatherCubit/weatherCubit.dart';
import 'package:weather_app/models/weathermodel.dart';

class Searchingpage extends StatefulWidget {
  const Searchingpage({super.key});

  @override
  State<Searchingpage> createState() => _SearchingpageState();
}

class _SearchingpageState extends State<Searchingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        // foregroundColor: Colors.white,
        centerTitle: true,
        title: defulttext(data: "Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            TextFormField(
              onFieldSubmitted: (value) async {
                var cubit = Weathercubit.get(context);
                cubit.Getweather(cityName: value);

                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                label: Text("search"),
                suffix: Icon(Icons.search),
                hintText: "Enter City Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
