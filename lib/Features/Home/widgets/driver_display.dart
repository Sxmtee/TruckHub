import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Features/Home/widgets/book_a_driver.dart';
import 'package:trucks/Models/drivermodel.dart';

class DriverDisplay extends ConsumerWidget {
  final List<DriverModel> drivers;
  const DriverDisplay({super.key, required this.drivers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        final driverList = drivers[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              bookADriver(
                context: context,
                ref: ref,
                name: driverList.name,
                profilePic: driverList.profilePic,
                uid: driverList.uid,
                userToken: driverList.userToken,
                phoneNumber: driverList.phoneNumber,
                email: driverList.email,
              );
            },
            leading: CircleAvatar(
              radius: 43,
              backgroundImage: NetworkImage(driverList.profilePic),
            ),
            title: Text(
              driverList.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              driverList.phoneNumber,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(CupertinoIcons.forward),
          ),
        );
      },
    );
  }
}
