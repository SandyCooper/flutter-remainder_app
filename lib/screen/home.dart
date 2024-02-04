import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(context) {
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
        ],
      ),
      body:  Center(
        child: Text(remainderMessage.isEmpty? "Hello World!" : "$remainderMessage - $hours : $minute $ampm"),
      ),
    );
  }
}
