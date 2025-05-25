import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/weatherapp.dart';
import 'package:weather_app/cubit/weatherCubit/weatherCubit.dart';
import 'package:weather_app/cubit/weatherCubit/weatherstate.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Weathercubit(),
      child: BlocBuilder<Weathercubit, Weatherstate>(
        builder:
            (context, state) => MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: themeColor(
                    Weathercubit.get(context).weathermodel?.text,
                  ),
                ),
                useMaterial3: false,
              ),
              debugShowCheckedModeBanner: false,
              home: Weatherapp(),
            ),
      ),
    );
  }
}

MaterialColor themeColor(String? condition) {
  final lower = condition?.toLowerCase();
  if (lower == null) {
    return Colors.blue;
  } else if (lower.contains("sunny") || lower.contains("clear")) {
    return Colors.amber;
  } else if (lower.contains("partly cloudy")) {
    return Colors.orange;
  } else if (lower.contains("cloudy") || lower.contains("overcast")) {
    return Colors.grey;
  } else if (lower.contains("mist") ||
      lower.contains("fog") ||
      lower.contains("freezing fog")) {
    return Colors.blueGrey;
  } else if (lower.contains("rain") ||
      lower.contains("drizzle") ||
      lower.contains("shower")) {
    return Colors.blue;
  } else if (lower.contains("snow") ||
      lower.contains("blizzard") ||
      lower.contains("sleet")) {
    return Colors.cyan;
  } else if (lower.contains("thunder")) {
    return Colors.deepPurple;
  } else if (lower.contains("ice pellets")) {
    return Colors.indigo;
  } else {
    return Colors.teal; // default fallback
  }
}
