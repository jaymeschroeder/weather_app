import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/view_models/user_view_model.dart';
import '../screens/settings_page.dart';
import '../view_models/weather_collection_view_model.dart';
import '../models/user.dart';
import '../views/user_details_view.dart';
import '../views/weather_view.dart';

class MainPage extends ConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          UserDetailsView(),
          Spacer(),
          const Expanded(child: WeatherView()),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage())),
            child: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
