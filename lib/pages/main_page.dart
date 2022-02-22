import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/update_location_controller.dart';
import '../models/weather_collection.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<UpdateLocationController>(
            init: UpdateLocationController(),
            builder: (state) {
              return Center(
                child: FutureBuilder(
                  future: state.getData(context),
                  builder: (BuildContext context, AsyncSnapshot<WeatherCollection> snapshot) {
                    if (snapshot.hasData) {
                      WeatherCollection? weatherCollection = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weatherCollection!.getWeatherData().main!),
                          Text(weatherCollection.getWeatherData().description!),
                          Text("Temperature: ${weatherCollection.getMainData().temp}"),
                          Text("Humidity: ${weatherCollection.getMainData().humidity}"),
                          Text("Temperature feels like: ${weatherCollection.getMainData().feels_like}"),
                          ElevatedButton(
                              onPressed: () {
                                state.incrementLongitude();
                              },
                              child: const Text("Increment Longitude"))
                        ],
                      );
                    } else {
                      return const Text("No Data Available");
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
