import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Utils/yes_or_no_dialog.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';

void bookADriver({
  required BuildContext context,
  required String name,
  required String profilePic,
  required String phoneNumber,
  required String email,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ford T-450, Black"),
                Icon(Icons.phone),
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
                  onPressed: () {},
                  child: const Text("View Profile"),
                ),
                MaterialButton(
                  height: 50,
                  shape: const StadiumBorder(),
                  color: blackColor,
                  minWidth: 100,
                  textColor: whiteColor,
                  onPressed: () {
                    showYesOrNoAlertDialog(
                      context: context,
                      title: "Sure you want to book this driver",
                      onTap: () {
                        waiting(context);
                      },
                    );
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

void waiting(BuildContext context) {
  SizeConfig.init(context);

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: SizeConfig.sHeight * 38,
        width: SizeConfig.screenWidth,
        child: Column(
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
            const Loader(),
            SizedBox(
              height: SizeConfig.sHeight * 1.5,
            ),
            GenericElevatedButton(
              backgroundColor: whiteColor,
              color: blackColor,
              onPressed: () {},
              title: "Cancel",
            ),
          ],
        ),
      );
    },
  );
}
