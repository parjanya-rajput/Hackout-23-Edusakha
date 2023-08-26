import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';

@immutable //Internals are never changed moreover the child class also cannot have changeable internals
class AuthUser {
  final bool isEmailVerified;
  final String email;
  final String id;

  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
    id: user.uid,
    email: user.email!,
    isEmailVerified: user.emailVerified,
  ); //Factory constructors are like shared/cached constructor saves memory and time
}