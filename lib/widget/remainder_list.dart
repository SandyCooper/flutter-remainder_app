import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/local_notification.dart';
// import 'package:flutter_remainder_app/data/functions.dart';
import 'package:flutter_remainder_app/data/modal.dart';
import 'package:flutter_remainder_app/data/styles.dart';
import 'package:flutter_remainder_app/provider/list_of_remainder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemainderList extends ConsumerStatefulWidget {
  const RemainderList({super.key});

  @override
  ConsumerState<RemainderList> createState() {
    return _RemainderListState();
  }
}

class _RemainderListState extends ConsumerState<RemainderList> {
  Widget remainderContainer(int index, List<Remainders> rml) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      // height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 255, 219),
        borderRadius: BorderRadius.circular(18),
        border: Border(
          top: borderSide,
          right: borderSide,
          left: borderSide,
          bottom: borderSide,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Text(
                rml[index].message,
                style: const TextStyle(
                  color: Color.fromARGB(255, 60, 77, 60),
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
                softWrap: true,
              ),
            ),
          ),
          Container(
            width: 100,
            child: Text(
              rml[index].scheduleTime,
              style: const TextStyle(
                color: Color.fromARGB(255, 37, 46, 37),
                fontSize: 14,
                // fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    final rmainderList = ref.watch(listOfRemainderProvider);
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: rmainderList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(rmainderList[index]),
        onDismissed: (d) {
          LocalNotification.deleteSpecificNotification(rmainderList[index].id);
            rmainderList.removeAt(index);
        },
        child: remainderContainer(index, rmainderList),
      ),
    );
  }
}
