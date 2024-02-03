import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/widget/overlay_set_time.dart';

class Functions {
  static OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => const OverlaySetTime(),
    );
  static void showOverlay(BuildContext context) async {
    OverlayState overlay = Overlay.of(context);
    overlay.insert(overlayEntry);
  }
}