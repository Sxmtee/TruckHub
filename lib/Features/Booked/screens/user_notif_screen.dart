import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Utils/yes_or_no_dialog.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Features/Auth/widgets/generic_circle.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';
import 'package:trucks/Features/Booked/widgets/custom_card_widget.dart';
import 'package:trucks/Models/user_order_model.dart';

class UserNotifScreen extends StatelessWidget {
  final List<UsersOrderModel> usersOrderModel;
  const UserNotifScreen({super.key, required this.usersOrderModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usersOrderModel.length,
      itemBuilder: (context, index) {
        final users = usersOrderModel[index];

        return Column(
          children: [
            const GenericText(
              noCenterAlign: true,
              color: blackColor,
              fontSize: fontSize2half,
              fontWeight: fontWeight4,
              text: todayString,
            ),
            const Gap(5),
            GenericCardWidgetWithLeadingWidget(
              onTap: () {},
              title: successfullBookString,
              subtitle: thankYouForBooking,
              leadingWidgt: const GenericCircleAvatar(
                radius: 40,
                child: FaIcon(
                  Icons.check,
                  color: whiteColor,
                ),
              ),
            ),
            Card(
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
                      text: users.name,
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
            ),
            GenericCardWidgetWithLeadingWidget(
              onTap: () {},
              title: discountString,
              subtitle: thankYouForBooking,
              leadingWidgt: const GenericCircleAvatar(
                radius: 40,
                child: FaIcon(
                  Icons.check,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
