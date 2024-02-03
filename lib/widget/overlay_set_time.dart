import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';

class OverlaySetTime extends StatefulWidget {
  const OverlaySetTime({super.key});

  @override
  State<OverlaySetTime> createState() {
    return _OverlaySetTimeState();
  }
}

class _OverlaySetTimeState extends State<OverlaySetTime> {
  final remainderMessageController = TextEditingController();
  String remainderMessage = "";

  @override
  void dispose() {
    remainderMessageController.dispose();
    super.dispose();
  }

  Widget container() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: remainderMessageController,
              decoration: InputDecoration(
                hintText: "Write Something",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // onSubmitted: (value) {
              //   setState((){
              //     remainderMessage = remainderMessageController.text;
              //   });
              // },
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green,
                    // child: Text("hi how are you?"),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        remainderMessage = remainderMessageController.text;
                        print(remainderMessage);
                        Functions.overlayEntry.remove();
                        // });
                      },
                      child: Text("Test"),
                    ),
                    // child: Text("hi how are you?"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(146, 0, 0, 0),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          width: 300,
          // color: Colors.red,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 255, 219),
            borderRadius: BorderRadius.circular(15),
            border: const Border(
              top: BorderSide(
                  color: const Color.fromARGB(255, 126, 230, 129),
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: 0),
              right: BorderSide(
                  color: const Color.fromARGB(255, 126, 230, 129),
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: 0),
              left: BorderSide(
                  color: const Color.fromARGB(255, 126, 230, 129),
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: 0),
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 126, 230, 129),
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: 0),
            ),
          ),
          child: container(),
        ),
      ),
    );
  }
}
