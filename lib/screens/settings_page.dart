import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/edit_location_view.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new)),
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: const EditLocationView()

    );
  }
}
