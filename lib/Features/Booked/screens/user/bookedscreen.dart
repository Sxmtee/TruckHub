import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Features/Booked/controller/booked_controller.dart';
import 'package:trucks/Features/Booked/screens/user/user_notif_screen.dart';

class Booked extends ConsumerWidget {
  const Booked({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(bookedController).fetchBookedDriver(),
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

        return UserNotifScreen(usersOrderModel: data!);
      },
    );
  }
}
