import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/local_notification.dart';
import 'package:flutter_remainder_app/data/styles.dart';

class OverlaySetTime extends StatefulWidget {
  const OverlaySetTime({super.key});

  @override
  State<OverlaySetTime> createState() {
    return _OverlaySetTimeState();
  }
}

class _OverlaySetTimeState extends State<OverlaySetTime> {
  final remainderMessageController = TextEditingController();
  // String timeOfDay =

  @override
  void dispose() {
    remainderMessageController.dispose();
    super.dispose();
  }

  // void timePicker(BuildContext context) async {
  //   Functions.overlayEntry.remove();
  //   // await Future.delayed(const Duration(seconds: 1));
  //   showTimePicker(context: context, initialTime: TimeOfDay.now())
  //       .then((value) {
  //     // setState(() {
  //     timeOfDay = value!;
  //     // Functions.showOverlay(context);
  //     // });
  //   });
  //   // Functions.showOverlay(context);
  // }

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
                    // color: Colors.green,
                    child: ElevatedButton(
                      onPressed: () {
                        Functions.overlayEntry.remove();
                        Functions.showOverlay2(context);
                      },
                      child: Text(hours.isEmpty &&
                              minute.isEmpty &&
                              ampm.isEmpty
                          ? TimeOfDay.now().format(context).toString()
                          : "${hours.length == 2 ? hours : '0$hours'} : ${minute.length == 2 ? minute : '0$minute'} $ampm"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        remainderMessage = remainderMessageController.text;
                        // print(remainderMessage);
                        LocalNotification.scheduleNotification(
                            title: "Remainder",
                            body: remainderMessage,
                            payload: remainderMessage);
                    
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
            border: Border(
              top: borderSide,
              right: borderSide,
              left: borderSide,
              bottom: borderSide,
            ),
          ),
          child: container(),
        ),
      ),
    );
  }
}
