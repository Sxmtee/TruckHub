import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Models/drivermodel.dart';

class DriverDisplay extends StatelessWidget {
  final List<DriverModel> drivers;
  const DriverDisplay({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
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
