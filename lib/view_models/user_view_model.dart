import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

final userProvider = StateNotifierProvider<UserViewModel, User>((ref) => UserViewModel());

class UserViewModel extends StateNotifier<User> {
  UserViewModel() : super(const User());

  updateName(String name){
    state = state.copyWith(name: name);
  }

  increaseAge(){
    state = state.copyWith(age: state.age + 1);
  }
}