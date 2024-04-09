import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class DriverProfile extends StatelessWidget {
  static const routeName = "/Driver-profile";
  final String profilePic;
  final String name;
  final String phoneNumber;
  const DriverProfile({
    super.key,
    required this.profilePic,
    required this.name,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const GenericText(
          text: driverProfileString,
          fontSize: fontSize3,
          fontWeight: fontWeight5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(profilepic),
                ),
                const Gap(10),
                GenericText(
                  color: Theme.of(context).iconTheme.color,
                  text: name.toUpperCase(),
                  fontSize: fontSize3,
                  fontWeight: fontWeight6,
                ),
                const Gap(5),
                Wrap(
                  spacing: 10,
                  children: [
                    FaIcon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    GenericText(
                      color: Theme.of(context).iconTheme.color,
                      text: driverLocationString,
                      fontSize: fontSize3,
                      fontWeight: fontWeight3,
                    )
                  ],
                ),
                const Gap(5),
                GenericText(
                  color: Theme.of(context).iconTheme.color,
                  text: phoneNumber,
                  fontSize: fontSize3,
                  fontWeight: fontWeight3,
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericText(
                          color: Theme.of(context).iconTheme.color,
                          text: vehicleDetailsString,
                          fontSize: fontSize3half,
                          fontWeight: fontWeight6,
                        ),
                        const Gap(5),
                        GenericText(
                          color: Theme.of(context).iconTheme.color,
                          text: truckDetailsString,
                          fontSize: fontSize3,
                          fontWeight: fontWeight3,
                        ),
                        GenericText(
                          color: Theme.of(context).iconTheme.color,
                          text: truckNumberString,
                          fontSize: fontSize3,
                          fontWeight: fontWeight3,
                        ),
                        const Gap(20),
                        GenericText(
                          color: Theme.of(context).iconTheme.color,
                          text: driverReviewString,
                          fontSize: fontSize3half,
                          fontWeight: fontWeight6,
                        ),
                        const Gap(5),
                        GenericText(
                          color: Theme.of(context).iconTheme.color,
                          text: noReviewString,
                          fontSize: fontSize3,
                          fontWeight: fontWeight3,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        FlutterPhoneDirectCaller.callNumber(phoneNumber);
                      },
                      icon: const FaIcon(Icons.call_outlined),
                      color: Theme.of(context).iconTheme.color,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
