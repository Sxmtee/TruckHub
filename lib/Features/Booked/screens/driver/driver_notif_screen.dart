import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Utils/yes_or_no_dialog.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Features/Auth/widgets/generic_circle.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class DriverNotifScreen extends StatelessWidget {
  final List<Map<String, dynamic>> passenger;
  const DriverNotifScreen({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: passenger.length,
        itemBuilder: (context, index) {
          final request = passenger[index];

          return Card(
            color: whiteColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 0.2,
                color: blackColor.withOpacity(0.5),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(5),
                  dense: true,
                  minLeadingWidth: 0,
                  leading: const GenericCircleAvatar(
                    radius: 40,
                    child: FaIcon(
                      FontAwesomeIcons.truckPickup,
                      color: whiteColor,
                    ),
                  ),
                  title: const GenericText(
                    noCenterAlign: true,
                    fontSize: fontSize3half,
                    fontWeight: fontWeight7,
                    text: riderString,
                  ),
                  subtitle: GenericText(
                    noCenterAlign: true,
                    fontSize: fontSize2half,
                    fontWeight: fontWeight3,
                    text: request["user_name"],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GenericElevatedButton(
                          noMargin: true,
                          backgroundColor: whiteColor,
                          color: blackColor,
                          onPressed: () {
                            showYesOrNoAlertDialog(
                              context: context,
                              title: cancelYourRideString,
                              onTap: () {},
                            );
                          },
                          title: cancelString,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        flex: 1,
                        child: GenericElevatedButton(
                          noMargin: true,
                          onPressed: () {
                            showSnackBar(context, continuedString);
                          },
                          title: continueString,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
