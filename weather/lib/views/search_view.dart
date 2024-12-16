import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(
            controller: controller,
            // 6. Trigger Cubit
            onSubmitted: (value) async {
              log(value);
              BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
              await Future.delayed(const Duration(milliseconds: 500));    // wait for 500ms before transition to give time for the API call to complete
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              labelText: "Search",
              hintText: "Enter a city name",
              hintStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async{
                  final value = controller.text;
                  log(value);
                  BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
                  await Future.delayed(const Duration(milliseconds: 1200));    // wait for 1200ms before transition to give time for the API call to complete
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
