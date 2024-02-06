import 'package:flutter_remainder_app/data/modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfRemainderNotifier extends StateNotifier<List<Remainders>> {
  ListOfRemainderNotifier() : super([]);

  void addRemainder(String message, String time) {
    Remainders newRemainder = Remainders(message: message, scheduleTime: time);

    state = [newRemainder, ...state];
  }
}

final listOfRemainderProvider =
    StateNotifierProvider<ListOfRemainderNotifier, List<Remainders>>(
        (ref) => ListOfRemainderNotifier());
