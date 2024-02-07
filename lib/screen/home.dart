import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/local_notification.dart';
import 'package:flutter_remainder_app/provider/list_of_remainder.dart';
import 'package:flutter_remainder_app/widget/remainder_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSceen extends ConsumerWidget {
  const HomeSceen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final rm = ref.watch(listOfRemainderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remainder"),
        backgroundColor: const Color.fromARGB(255, 126, 230, 129),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Functions.showOverlay(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              LocalNotification.deleteAllNotification();
              ref.read(listOfRemainderProvider.notifier).deleteAllRemainder();
            },
          ),
        ],
      ),
      body: rm.isEmpty
          ? const Center(
              child: Text("Hello World!"),
            )
          : const RemainderList(),
    );
  }
}
