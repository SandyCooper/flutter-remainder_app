import 'package:flutter/material.dart';

class OverlaySetTime extends StatefulWidget {
  const OverlaySetTime({super.key});

  @override
  State<OverlaySetTime> createState() {
    return _OverlaySetTimeState();
  }
}

class _OverlaySetTimeState extends State<OverlaySetTime> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(146, 0, 0, 0),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
