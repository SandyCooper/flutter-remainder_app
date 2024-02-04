import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/styles.dart';

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

  

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
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
                child: TextField(
                  controller: hoursController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "H",
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: minutesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "M",
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        })),
                Expanded(
                    child: Container(
                  child: Text(isSwitched ? "PM" : "AM"),
                )),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Functions.overlayEntry2.remove();
                      hours = hoursController.text;
                      minute = minutesController.text;
                      ampm = isSwitched ? "PM" : "AM";
                      Functions.showOverlay(context);
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
      body: Center(
        child: timeContainer(),
      ),
    );
  }
}
