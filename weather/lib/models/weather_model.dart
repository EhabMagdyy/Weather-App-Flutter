
class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temperature;
  final String? image;
  final double? minTemp;
  final double? maxTemp;
  final int? humidity;
  final double? windSpeed;
  final String? weatherCondition;
  final double? uvIndex;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temperature,
    required this.image,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCondition,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temperature: json['current']['temp_c'],
      image: json['current']['condition']['icon'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      windSpeed: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      uvIndex: json['forecast']['forecastday'][0]['day']['uv'],
    );
  }
}