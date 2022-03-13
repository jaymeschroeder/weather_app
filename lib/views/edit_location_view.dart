import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/weather_collection_view_model.dart';

class EditLocationView extends ConsumerWidget {
  const EditLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherCollection = ref.watch(weatherCollectionProvider);
    final weatherCollectionController = ref.watch(weatherCollectionProvider.notifier);

    final latController = TextEditingController();
    final longController = TextEditingController();

    return weatherCollection.when(
        data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text("Latitude ${weatherCollectionController.lat}"),
                      TextField(
                        controller: latController,
                        onSubmitted: (text) => weatherCollectionController.updateLatitude(double.parse(text)),
                      ),
                      Text("Longitude ${weatherCollectionController.long}"),
                      TextField(
                        controller: longController,
                        onSubmitted: (text) => weatherCollectionController.updateLongitude(double.parse(text)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        error: (error, stack) => Text("Error loading data: $error"),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
