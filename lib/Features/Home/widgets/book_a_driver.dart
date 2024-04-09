import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';
import 'package:trucks/Features/Booked/controller/booked_controller.dart';
import 'package:trucks/Features/Home/controller/driver_controller.dart';
import 'package:trucks/Features/Home/repo/push_notif_repo.dart';
import 'package:trucks/Features/Home/widgets/driver_profile.dart';
import 'package:trucks/Models/user.preferences.dart';

void bookADriver({
  required BuildContext context,
  required WidgetRef ref,
  required String name,
  required String uid,
  required String profilePic,
  required String userToken,
  required String phoneNumber,
  required String email,
}) {
  SizeConfig.init(context);
  final username = TruckPreferences.getNickname();
  final userphone = TruckPreferences.getPhone();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: SizeConfig.sHeight * 38,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ford T-450, Black"),
                IconButton(
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(phoneNumber);
                  },
                  icon: const Icon(Icons.phone),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FST537GX"),
                Icon(Icons.location_on),
                Text("800(5 mins away)"),
              ],
            ),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  height: 50,
                  shape: const StadiumBorder(),
                  minWidth: 100,
                  color: whiteColor,
                  textColor: blackColor,
                  onPressed: () => Navigator.of(context).pushNamed(
                    DriverProfile.routeName,
                    arguments: {
                      "profilePic": profilePic,
                      "name": name,
                      "phoneNumber": phoneNumber,
                    },
                  ),
                  child: const Text("View Profile"),
                ),
                MaterialButton(
                  height: 50,
                  shape: const StadiumBorder(),
                  color: blackColor,
                  minWidth: 100,
                  textColor: whiteColor,
                  onPressed: () {
                    MessageApi.sendNotificationToUser(
                      userToken: userToken,
                      title: "Waiting Passenger",
                      body: "Open app to accept passenger",
                    ).whenComplete(() {
                      ref
                          .read(driverController)
                          .setDriverUser(
                            userName: username!,
                            userPhoneNumber: userphone!,
                            driverName: name,
                            driverPhone: phoneNumber,
                            driverEmail: email,
                            driverId: uid,
                            driverPic: profilePic,
                          )
                          .whenComplete(() {
                        waiting(
                          context: context,
                          ref: ref,
                          uid: uid,
                        );
                      });
                    });
                  },
                  child: const Text("Book"),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

void waiting({
  required BuildContext context,
  required WidgetRef ref,
  required String uid,
}) {
  SizeConfig.init(context);

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: SizeConfig.sHeight * 38,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Waiting for driver to respond",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            StreamBuilder(
              stream: ref.watch(bookedController).userData(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                }

                if (snapshot.data!.isAccepted) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  showSnackBar(
                    context,
                    "Driver Accepted\n5 meters away from you\nGo to notifications if you want to cancel",
                  );
                }
                return const Loader();
              },
            ),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            GenericElevatedButton(
              backgroundColor: whiteColor,
              color: blackColor,
              onPressed: () {
                showSnackBar(context, "Ride canceled\nBook another ride");
              },
              title: "Cancel",
            ),
          ],
        ),
      );
    },
  );
}
