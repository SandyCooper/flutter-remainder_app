import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(10),
      height: 70,
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
      child: Row(
        children: [
          Text(rml[index].message),
          Text(rml[index].scheduleTime),
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
      itemBuilder: (context, index) => remainderContainer(index, rmainderList),
    );
  }
}
