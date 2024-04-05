import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Utils/dimension.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenericElevatedButton(
                  backgroundColor: whiteColor,
                  color: blackColor,
                  onPressed: () {},
                  title: "View Profile",
                ),
                GenericElevatedButton(
                  backgroundColor: whiteColor,
                  color: blackColor,
                  onPressed: () {},
                  title: "Book",
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
