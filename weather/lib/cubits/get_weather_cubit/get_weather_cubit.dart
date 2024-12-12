import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

// 2. Create Cubit
class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit() : super(InitialNoWeatherState());
  WeatherModel? weatherModel;
  // 3. Create a method to get weather
  getWeather({required String cityName}) async
  {
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}