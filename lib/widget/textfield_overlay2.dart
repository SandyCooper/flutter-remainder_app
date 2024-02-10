import 'package:flutter/material.dart';

class Overlay2TextField extends StatefulWidget {
  const Overlay2TextField({
    super.key,
    required this.controller,
    required this.borderSide,
    required this.hintText,
    required this.error,
  });

  final TextEditingController controller;
  final BorderSide borderSide;
  final String hintText;
  final bool error;

  @override
  State<Overlay2TextField> createState() {
    return _Overlay2TextFieldState();
  }
}

class _Overlay2TextFieldState extends State<Overlay2TextField> {
  bool errorSet = true;
  @override
  Widget build(context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          errorSet = false;
        });
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.error && errorSet
            ? const Color.fromARGB(255, 252, 191, 189)
            : const Color.fromARGB(255, 189, 252, 191),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderSide
              .copyWith(width: 2, color: const Color.fromARGB(255, 47, 87, 48)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.borderSide
              .copyWith(color: const Color.fromARGB(255, 47, 87, 48), width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
