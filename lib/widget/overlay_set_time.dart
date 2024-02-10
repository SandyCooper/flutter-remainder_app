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
  bool error = false;

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
                filled: true,
                fillColor: error
                    ? const Color.fromARGB(255, 252, 191, 189)
                    : const Color.fromARGB(255, 189, 252, 191),
                // fillColor: Color.fromARGB(255, 189, 252, 191),
                enabledBorder: OutlineInputBorder(
                  borderSide: borderSide.copyWith(
                      width: 2, color: const Color.fromARGB(255, 47, 87, 48)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: borderSide.copyWith(
                      color: const Color.fromARGB(255, 47, 87, 48), width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Write Something",
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 189, 252, 191),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: borderSide.copyWith(
                                width: 2,
                                color: const Color.fromARGB(255, 47, 87, 48)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        Functions.overlayEntry.remove();
                        Functions.showOverlay2(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${daate.length == 2 ? daate : '0$daate'}/${DateTime.now().month.toString().length == 2 ? DateTime.now().month : '0${DateTime.now().month}'}/${DateTime.now().year}",
                          ),
                          Text(hours.isEmpty && minute.isEmpty && ampm.isEmpty
                              ? TimeOfDay.now().format(context).toString()
                              : "${hours.length == 2 ? hours : '0$hours'} : ${minute.length == 2 ? minute : '0$minute'} $ampm"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 189, 252, 191),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: borderSide.copyWith(
                                width: 2,
                                color: const Color.fromARGB(255, 47, 87, 48)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (remainderMessageController.text.isNotEmpty) {
                          remainderMessage = remainderMessageController.text;
                          var scheduleTimes =
                              "${hours.length == 2 ? hours : '0$hours'} : ${minute.length == 2 ? minute : '0$minute'} $ampm";
                          ref
                              .read(listOfRemainderProvider.notifier)
                              .addRemainder(remainderMessage, scheduleTimes);
                          LocalNotification.scheduleNotification(hours, minute,
                              title: "Remainder",
                              body: remainderMessage,
                              payload: remainderMessage);
                          Functions.overlayEntry.remove();
                          counti++;
                        } else {
                          // Functions.overlayEntry.remove();
                          setState(() {
                            error = remainderMessageController.text.isEmpty
                                ? true
                                : false;
                          });
                        }
                      },
                      child: const Text("Set"),
                    ),
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
      backgroundColor: const Color.fromARGB(146, 0, 0, 0),
      body: Stack(
        children: [Positioned(
          top: 110,
          left: 310,
          child: GestureDetector(
            onTap: () {
              Functions.overlayEntry.remove();
            },
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 252, 191, 189),
            ),
          ),
        ),Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 175,
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
        ),]
      ),
    );
  }
}
