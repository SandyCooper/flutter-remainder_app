import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/widget/overlay_set_time.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  void showOverlay(BuildContext context) async {
    OverlayState overlay = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => const OverlaySetTime(),
    );

    overlay.insert(overlayEntry);
    await Future.delayed(
      const Duration(seconds: 5),
    );

    overlayEntry.remove();
  }

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
              showOverlay(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
