import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Theme/theme_provider.dart';
import 'package:trucks/Common/Utils/app_dialogs.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/spacing.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Utils/yes_or_no_dialog.dart';
import 'package:trucks/Common/Widgets/icon_box.dart';
import 'package:trucks/Common/Widgets/settings_card.dart';
import 'package:trucks/Features/Account/screens/user/profile_screen.dart';
import 'package:trucks/Features/Auth/controllers/auth_controllers.dart';

class Account extends ConsumerWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final themeModeState = ref.watch(themesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text(
            "General",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SpacingManager.h7,
          SettingsCard(
            height: SizeConfig.sHeight * 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProfileScreen.routeName);
                  },
                  leading: IconBox(
                    color: Colors.grey,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Profile Setup"),
                ),
                ListTile(
                  leading: IconBox(
                    color: Colors.blue,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.color_lens_rounded,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Theme"),
                  trailing: Switch(
                    activeColor: AppColors.tertiaryColor,
                    value: themeModeState == ThemeMode.dark,
                    onChanged: (value) {
                      ref.read(themesProvider.notifier).changeTheme(value);
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          const Text(
            "Support",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          SettingsCard(
            height: SizeConfig.sHeight * 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {},
                  leading: IconBox(
                    color: Colors.blue,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.reviews_rounded,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Review"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          const Text(
            "Legal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          SettingsCard(
            height: SizeConfig.sHeight * 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AppDialogs(
                          titleText: "Privacy Policy",
                          contentText: termsAndPolicyString,
                          commandText: "Ok",
                          commandPress: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                  leading: IconBox(
                    color: Colors.purple,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.policy_rounded,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Privacy Policy"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          const Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
          SettingsCard(
            height: SizeConfig.sHeight * 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    showYesOrNoAlertDialog(
                      context: context,
                      title: "Are you sure you want to log out",
                      onTap: () {
                        ref.read(authControllerProvider).signOut(context);
                      },
                    );
                  },
                  leading: IconBox(
                    color: Colors.red.shade400,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Log Out"),
                ),
                ListTile(
                  onTap: () {},
                  leading: IconBox(
                    color: Colors.red,
                    height: SizeConfig.sHeight * 5,
                    width: SizeConfig.sWidth * 10,
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text("Delete Account"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.sHeight * 1.5,
          ),
        ],
      ),
    );
  }
}
