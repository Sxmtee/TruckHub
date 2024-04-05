import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Features/Home/repo/driver_repo.dart';
import 'package:trucks/Features/Home/widgets/driver_display.dart';

class FetchDriver extends ConsumerWidget {
  const FetchDriver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(driverRepo).fetchDrivers(context),
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

        return DriverDisplay(drivers: data!);
      },
    );
  }
}
