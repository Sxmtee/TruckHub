import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Features/Auth/repo/auth_repo.dart';
import 'package:trucks/Models/usermodel.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepoProvider = ref.watch(authRepo);
    return AuthController(authRepo: authRepoProvider);
  },
);

final userDataAuthProvider = FutureProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider);
    return authController.getUserData();
  },
);

class AuthController {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepo.getCurrentUserData();
    return user;
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
    required String password,
  }) {
    authRepo.signUserUp(
      context: context,
      name: name,
      email: email,
      password: password,
    );
  }

  void signOut(BuildContext context) {
    return authRepo.signOut(context);
  }
}
