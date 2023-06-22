import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class InitialUserFA {
  final String user;

  InitialUserFA({
    required this.user,
  });
  factory InitialUserFA.fromJson(Map<String, dynamic> json) =>
      _userFromJson(json);
  Map<String, dynamic> toJson() => _userToJson(this);
  factory InitialUserFA.fromSnapshot(DocumentSnapshot snapshot) {
    final newUser =
        InitialUserFA.fromJson(snapshot.data() as Map<String, dynamic>);

    return newUser;
  }
  @override
  String toString() => 'User<$user>';
}

InitialUserFA _userFromJson(Map<String, dynamic> json) {
  return InitialUserFA(
    user: json['user'].trim(),
  );
}

Map<String, dynamic> _userToJson(InitialUserFA instance) => <String, dynamic>{
      'user': instance.user,
    };
