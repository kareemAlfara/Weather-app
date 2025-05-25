import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weatherCubit/weatherstate.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/Weatherservices.dart';

class Weathercubit extends Cubit<Weatherstate> {
  Weathercubit() : super(weatherIntialState());
  Weathermodel ?weathermodel;
  static Weathercubit get(context) => BlocProvider.of(context);
  Getweather({required String cityName}) async {
    try {
      emit(weatherLodingState());
      weathermodel = await Services(
        dio: Dio(),
      ).GetWeather(cityName: cityName);

      emit(GetweatherState(weathermodel: weathermodel!));
    } catch (e) {
      emit(weatherErrorState(error: e.toString()));
    }
  }
}
