import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/styles.dart';
import 'package:flutter_remainder_app/widget/textfield_overlay2.dart';

class OverlatTimeContainer extends StatefulWidget {
  const OverlatTimeContainer({super.key});

  @override
  State<OverlatTimeContainer> createState() {
    return _OverlatTimeContainerState();
  }
}

class _OverlatTimeContainerState extends State<OverlatTimeContainer> {
  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool errorDate = false;
  bool errorHour = false;
  bool errorMinute = false;

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Widget timeContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 350,
      height: 200,
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
      child: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: Overlay2TextField(
                  controller: dateController,
                  borderSide: borderSide,
                  hintText: "Date",
                  error: errorDate,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Overlay2TextField(
                  controller: hoursController,
                  borderSide: borderSide,
                  hintText: "H",
                  error: errorHour,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Overlay2TextField(
                  controller: minutesController,
                  borderSide: borderSide,
                  hintText: "M",
                  error: errorMinute,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Switch(
                        activeColor: const Color.fromARGB(255, 65, 119, 67),
                        inactiveThumbColor:
                            const Color.fromARGB(255, 43, 77, 44),
                        trackOutlineColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 43, 77, 44),
                        ),
                        // inactiveTrackColor: Color.fromARGB(255, 43, 77, 44),
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        })),
                Expanded(
                  child: Text(
                    isSwitched ? "PM" : "AM",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 189, 252, 191),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: borderSide.copyWith(
                              width: 2,
                              color: const Color.fromARGB(255, 47, 87, 48)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (hoursController.text.isNotEmpty &&
                          minutesController.text.isNotEmpty &&
                          dateController.text.isNotEmpty) {
                        Functions.overlayEntry2.remove();
                        hours = hoursController.text;
                        minute = minutesController.text;
                        daate = dateController.text;
                        ampm = isSwitched ? "PM" : "AM";
                        Functions.showOverlay(context);
                      } else {
                        // Functions.overlayEntry2.remove();
                        // Functions.showOverlay(context);
                        setState(() {
                          errorDate =
                              dateController.text.isEmpty ? true : false;
                          errorHour =
                              hoursController.text.isEmpty ? true : false;
                          errorMinute =
                              minutesController.text.isEmpty ? true : false;
                        });
                      }
                    },
                    child: const Text("ok"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(132, 0, 0, 0),
      body: Stack(children: [
        Positioned(
          top: 150,
          left: 330,
          child: GestureDetector(
            onTap: () {
              Functions.overlayEntry2.remove();
              Functions.showOverlay(context);
            },
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 252, 191, 189),
            ),
          ),
        ),
        Center(
          child: timeContainer(),
        ),
      ]),
    );
  }
}
