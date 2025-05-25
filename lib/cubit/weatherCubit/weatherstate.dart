import 'package:weather_app/data/models/weathermodel.dart';

class Weatherstate {}

class weatherIntialState extends Weatherstate {}

class weatherLodingState extends Weatherstate {}

class GetweatherState extends Weatherstate {
  final Weathermodel weathermodel;

  GetweatherState({required this.weathermodel});
}

class weatherErrorState extends Weatherstate {
  final String error;

  weatherErrorState({required this.error});
}
