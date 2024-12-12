import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  final String baseURL = 'http://api.weatherapi.com/v1';
  final String key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx';

  Future<WeatherModel> getWeather({required String cityName}) async{
    try {
      final response = await dio.get(
        '$baseURL/forecast.json?key=$key&q=$cityName&days=1&aqi=no&alerts=no',
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      log("Dio exception: $e");
      final String errMessage = e.response?.data['error']['message'] ?? 'An error occurred';
      throw Exception(errMessage);
    }
    catch (e) {
      log("Exception: $e");
      throw Exception('An error occurred');
    }
  }
}