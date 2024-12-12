// 2. Create States

// Parent class
import 'package:weather/models/weather_model.dart';

class WeatherState{}

// State 1
class InitialNoWeatherState extends WeatherState{}

// State 2
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

// State 3
class WeatherFailureState extends WeatherState{}