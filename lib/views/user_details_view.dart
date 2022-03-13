import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../view_models/user_view_model.dart';

class UserDetailsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userController = ref.watch(userProvider.notifier);
    final User user = ref.watch(userProvider);

    return Column(
      children: [
        Text(user.name),
        Text("${user.age}"),
        ElevatedButton(onPressed: (){
          userController.increaseAge();
        }, child: const Text("Press to increment age"))

      ]
    );
  }

}