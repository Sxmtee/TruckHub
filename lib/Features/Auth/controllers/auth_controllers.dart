import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Features/Auth/repo/auth_repo.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepoProvider = ref.watch(authRepo);
    return AuthController(authRepo: authRepoProvider);
  },
);

class AuthController {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  void signDriverIn({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    authRepo.signDriverIn(
      context: context,
      email: email,
      password: password,
    );
  }

  void signDriverUp({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String price,
  }) {
    authRepo.signDriverUp(
      context: context,
      name: name,
      email: email,
      phone: phone,
      password: password,
      price: price,
    );
  }

  void signUserIn({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    authRepo.signUserIn(
      context: context,
      email: email,
      password: password,
    );
  }

  void signUserUp({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    authRepo.signUserUp(
      context: context,
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }

  void signOut(BuildContext context) {
    return authRepo.signOut(context);
  }
}
