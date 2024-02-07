import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/widget/overlay_set_time.dart';
import 'package:flutter_remainder_app/widget/overlay_time_container.dart';

class Functions {
  static OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => const OverlaySetTime(),
    // maintainState: true,
  );

  static OverlayEntry overlayEntry2 = OverlayEntry(
    builder: (context) => const OverlatTimeContainer(),
    // maintainState: true,
  );

  static Future<void> showOverlay(BuildContext context) async {
    OverlayState overlay = Overlay.of(context);
    overlay.insert(overlayEntry);
  }

  static void showOverlay2(BuildContext context) async {
    OverlayState overlay2 = Overlay.of(context);
    overlay2.insert(overlayEntry2);
  }
}

String remainderMessage = "";
String hours = "";
String minute = "";
String ampm = "";
bool isSwitched = false;
int counti = 0;
