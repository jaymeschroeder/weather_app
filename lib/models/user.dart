import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("Default Name") String name,
    @Default(0) int age,
    @Default(0) double wage,
  }) = _User;
}
