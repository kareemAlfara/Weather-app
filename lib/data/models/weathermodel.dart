class Weathermodel {
  final String Cityname;
  final String update;
  final String image;
  final String text;
  final double temp;
  final double Max_temp;
  final double Min_temp;

  Weathermodel( {
    required this.text,
    required this.Cityname,
    required this.update,
    required this.image,
    required this.temp,
    required this.Max_temp,
    required this.Min_temp,
  });
  factory Weathermodel.FromJson(json) {
    return Weathermodel(

      Cityname: json["location"]["name"],
      update: json["current"]["last_updated"],
      image: json['forecast']["forecastday"][0]["day"]["condition"]["icon"],
      text: json['forecast']["forecastday"][0]["day"]["condition"]["text"],
      temp: json['forecast']["forecastday"][0]["day"]["avgtemp_f"],
      Max_temp: json['forecast']["forecastday"][0]["day"]["maxtemp_f"],
      Min_temp: json['forecast']["forecastday"][0]["day"]["mintemp_f"],
    );
  }
}
