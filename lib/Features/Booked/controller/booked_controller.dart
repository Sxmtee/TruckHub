import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Features/Booked/repo/booked_repo.dart';
import 'package:trucks/Models/user_order_model.dart';

final bookedController = Provider((ref) {
  final books = ref.watch(bookedRepo);
  return BookedController(bookedRepo: books);
});

class BookedController {
  final BookedRepo bookedRepo;

  BookedController({required this.bookedRepo});

  Future<List<UsersOrderModel>> fetchBookedDriver() {
    return bookedRepo.fetchBookedDriver();
  }

  Future<List<Map<String, dynamic>>> fetchBookedUser() {
    return bookedRepo.fetchBookedUser();
  }

  Stream<UsersOrderModel> userData(String userId) {
    return bookedRepo.userData(userId);
  }

  void setUserState(String uid) {
    bookedRepo.setUserState(uid);
  }
}
