import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Features/Account/controller/account_controller.dart';
import 'package:trucks/Features/Account/screens/account_page.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = "/Profile-screen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(accountController).fetchUserAccount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loader(),
          );
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Text("No Data or Internet Connection"),
          );
        }
        if (snapshot.hasError) {
          return ErrorScreen(
            error: snapshot.error.toString(),
          );
        }

        final data = snapshot.data;

        return AccountPage(userModel: data!);
      },
    );
  }
}
