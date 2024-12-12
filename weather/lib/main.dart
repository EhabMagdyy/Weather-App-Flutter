import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. Provide Cubit
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              var weatherCondition = BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherCondition;
              return MaterialApp(
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(weatherCondition)[600],
                    foregroundColor: Colors.white,
                  ),
                  useMaterial3: false, // shadow
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {
    if (null == weatherCondition) {
      return Colors.blueGrey;
    }
    switch (weatherCondition) {
      case "Sunny":
      case "Clear":
        return Colors.orange;

      case "Partly cloudy":
        return Colors.amber;

      case "Cloudy":
      case "Overcast":
        return Colors.grey;

      case "Mist":
      case "Fog":
      case "Freezing fog":
        return Colors.blueGrey;

      case "Patchy rain possible":
      case "Patchy light rain":
      case "Light rain":
      case "Light rain shower":
        return Colors.lightBlue;

      case "Moderate rain":
      case "Moderate rain at times":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
        return Colors.blue;

      case "Heavy rain":
      case "Heavy rain at times":
      case "Moderate or heavy rain with thunder":
        return Colors.indigo;

      case "Patchy snow possible":
      case "Patchy light snow":
      case "Light snow":
      case "Light snow showers":
        return Colors.cyan;

      case "Moderate snow":
      case "Patchy moderate snow":
      case "Moderate or heavy snow showers":
      case "Moderate or heavy snow with thunder":
        return Colors.teal;

      case "Blowing snow":
      case "Blizzard":
      case "Patchy heavy snow":
      case "Heavy snow":
        return Colors.blueGrey;

      case "Patchy sleet possible":
      case "Light sleet":
      case "Light sleet showers":
      case "Moderate or heavy sleet":
      case "Moderate or heavy sleet showers":
        return Colors.purple;

      case "Patchy freezing drizzle possible":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
        return Colors.deepPurple;

      case "Thundery outbreaks possible":
      case "Patchy light rain with thunder":
        return Colors.deepOrange;

      case "Ice pellets":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.deepPurple;

      default:
        return Colors.blueGrey;
    }
  }
