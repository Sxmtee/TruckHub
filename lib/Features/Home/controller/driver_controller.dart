import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Features/Home/repo/driver_repo.dart';
import 'package:trucks/Models/drivermodel.dart';

final driverController = Provider((ref) {
  final driver = ref.watch(driverRepo);
  return DriverController(driverRepo: driver);
});

class DriverController {
  final DriverRepo driverRepo;

  DriverController({required this.driverRepo});

  Future<List<DriverModel>> fetchDrivers(BuildContext context) {
    return driverRepo.fetchDrivers(context);
  }

  Future<void> setDriverUser({
    required String userName,
    required String userPhoneNumber,
    required String driverName,
    required String driverPhone,
    required String driverEmail,
    required String driverId,
    required String driverPic,
  }) {
    return driverRepo.setDriverUser(
      userName: userName,
      userPhoneNumber: userPhoneNumber,
      driverName: driverName,
      driverPhone: driverPhone,
      driverEmail: driverEmail,
      driverId: driverId,
      driverPic: driverPic,
    );
  }
}
