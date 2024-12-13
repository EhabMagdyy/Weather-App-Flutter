import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: 
          [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: weatherModel.image!.contains("https:") ? "${weatherModel.image}" : "https:${weatherModel.image}",
              fit: BoxFit.cover,
              width: 200,
              height: 180,
              placeholder: (context, url) => const SizedBox(
                width: 200,
                height: 180.0,
              ),
              errorWidget: (context, url, error) => Image.network(
                'https://cdn.vectorstock.com/i/preview-1x/11/38/cloud-wifi-icon-vector-45101138.jpg',
                fit: BoxFit.cover,
                width: 200,
                height: 180.0,
              ),
            ),
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              "${weatherModel.temperature.round()}°",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              '${weatherModel.maxTemp!.round()}° / ${weatherModel.minTemp!.round()}°',
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              weatherModel.weatherCondition ?? 'Unknown condition',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24,),
            // Text(
            //   "updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}",
            //   style: const TextStyle(
            //     fontSize: 22,
            //   ),
            // ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}