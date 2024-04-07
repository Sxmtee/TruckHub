import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Features/Booked/controller/booked_controller.dart';
import 'package:trucks/Features/Booked/screens/driver/driver_notif_screen.dart';

class DBookedScreen extends ConsumerWidget {
  const DBookedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(bookedController).fetchBookedUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loader(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
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

        return DriverNotifScreen(passenger: data!);
      },
    );
  }
}
