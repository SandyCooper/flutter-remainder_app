import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/local_notification.dart';
import 'package:flutter_remainder_app/data/styles.dart';
import 'package:flutter_remainder_app/provider/list_of_remainder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlaySetTime extends ConsumerStatefulWidget {
  const OverlaySetTime({super.key});

  @override
  ConsumerState<OverlaySetTime> createState() {
    return _OverlaySetTimeState();
  }
}

class _OverlaySetTimeState extends ConsumerState<OverlaySetTime> {
  final remainderMessageController = TextEditingController();
  DateTime dat = DateTime.now();

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
                    // color: Colors.green,
                    child: ElevatedButton(
                      onPressed: () async {
                        Functions.overlayEntry.remove();
                        // await showDatePicker(
                        //         context: context,
                        //         initialDate: DateTime.now(),
                        //         firstDate: DateTime(2024),
                        //         lastDate: DateTime(2026))
                        //     .then((value) {
                        //   dat = value!;
                        //   print(dat);
                        // });
                        Functions.showOverlay2(context);
                        // print("hello");
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
                        var scheduleTimes =
                            "${hours.length == 2 ? hours : '0$hours'} : ${minute.length == 2 ? minute : '0$minute'} $ampm";
                        ref
                            .read(listOfRemainderProvider.notifier)
                            .addRemainder(remainderMessage, scheduleTimes);
                        LocalNotification.scheduleNotification(
                            title: "Remainder",
                            body: remainderMessage,
                            payload: remainderMessage);

                        // var date = DateTime.now().day;
                        // print(date);

                        Functions.overlayEntry.remove();
                        counti++;
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
