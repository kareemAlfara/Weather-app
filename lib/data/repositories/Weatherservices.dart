// "https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=cairo&aqi=no&alert=no"
import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weathermodel.dart';

class Services {
  final Dio dio;

  Services({required this.dio});
  Future<Weathermodel> GetWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=$cityName&aqi=no&alert=no",
      );
      var jsondata = response.data;
      Weathermodel weathermodel = Weathermodel.FromJson(jsondata);
      return weathermodel;
    } on DioException catch (e) {
      var error = e.response?.data ?? "opps there was an dio error";
      throw Exception(error);
    } catch (e) {
      print(e.toString());
      throw Exception("opps there was an other error");
    }
  }
}
