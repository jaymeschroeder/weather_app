import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/weather_collection_view_model.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherCollection = ref.watch(weatherCollectionProvider);
    final weatherCollectionController = ref.watch(weatherCollectionProvider.notifier);

    return weatherCollection.when(
        data: (data) {
          return Center(
            child: Column(
              children: [
                Text("Current temperature is: ${data.main.temp}"),
                Text("Feels like: ${data.main.feels_like}"),
                Text("Current air pressure is: ${data.main.pressure}"),
                Text("Current humidity is: ${data.main.humidity}"),
                const Spacer(),
                Text("Latitude is: ${weatherCollectionController.lat}"),
                Text("Longitude is: ${weatherCollectionController.long}"),
              ],
            ),
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

}