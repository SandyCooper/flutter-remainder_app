import 'package:flutter_remainder_app/data/modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfRemainderNotifier extends StateNotifier<List<Remainders>> {
  ListOfRemainderNotifier() : super([]);

  void addRemainder(String message, String time, int id) {
    Remainders newRemainder = Remainders(message: message, scheduleTime: time, id: id);

    state = [newRemainder, ...state];
  }

  void deleteAllRemainder() {
    state = [];
  }
}

final listOfRemainderProvider =
    StateNotifierProvider<ListOfRemainderNotifier, List<Remainders>>(
        (ref) => ListOfRemainderNotifier());
