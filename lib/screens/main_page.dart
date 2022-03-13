import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/view_models/user_view_model.dart';
import '../screens/settings_page.dart';
import '../view_models/weather_collection_view_model.dart';
import '../models/user.dart';

class MainPage extends ConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherCollection = ref.watch(weatherCollectionProvider);
    final weatherCollectionController = ref.watch(weatherCollectionProvider.notifier);
    final userController = ref.watch(userProvider.notifier);
    final User user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: weatherCollection.when(
          data: (data) {
            return Center(
              child: Column(
                children: [
                  Text("${user.name}"),
                  Text("${user.age}"),
                  ElevatedButton(onPressed: (){
                    userController.updateName("dolph");
                  }, child: Text("Increase Age")),
                  Text("Current temperature is: ${data.main.temp}"),
                  Text("Feels like: ${data.main.feels_like}"),
                  Text("Current air pressure is: ${data.main.pressure}"),
                  Text("Current humidity is: ${data.main.humidity}"),
                  const Spacer(),
                  Text("Latitude is: ${weatherCollectionController.lat}"),
                  Text("Longitude is: ${weatherCollectionController.long}"),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage())),
                    child: const Text("Settings"),
                  ),
                ],
              ),
            );
          },
          error: (error, stack) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
