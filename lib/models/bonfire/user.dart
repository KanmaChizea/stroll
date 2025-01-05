import 'package:equatable/equatable.dart';

class BonfireUser extends Equatable {
  final String username;
  final int age;
  final String imagePath;

  const BonfireUser(
      {required this.username, required this.age, required this.imagePath});

  @override
  List<Object> get props => [username, age, imagePath];

  factory BonfireUser.fromMap(Map<String, dynamic> map) {
    return BonfireUser(
      username: map['username'] as String,
      age: map['age'] as int,
      imagePath: map['imagePath'] as String,
    );
  }
}
