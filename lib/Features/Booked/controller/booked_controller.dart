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
}
