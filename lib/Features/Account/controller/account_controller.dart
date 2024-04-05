import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Features/Account/repo/account_repo.dart';
import 'package:trucks/Models/usermodel.dart';

final accountController = Provider((ref) {
  final repo = ref.watch(accountRepo);
  return AccountController(accountRepo: repo);
});

class AccountController {
  final AccountRepo accountRepo;

  AccountController({required this.accountRepo});

  Future<UserModel> fetchUserAccount() {
    return accountRepo.fetchUserAccount();
  }

  Future<void> updateUserDetails({
    required BuildContext context,
    required UserModel user,
  }) {
    return accountRepo.updateUserDetails(
      context: context,
      user: user,
    );
  }

  Future<UserModel> fetchDriverAccount() {
    return accountRepo.fetchDriverAccount();
  }

  Future<void> updateDriverDetails({
    required BuildContext context,
    required UserModel user,
  }) {
    return accountRepo.updateDriverDetails(
      context: context,
      user: user,
    );
  }
}
