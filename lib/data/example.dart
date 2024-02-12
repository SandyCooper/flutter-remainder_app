import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Movement Example'),
        ),
        body: ContainerMovementExample(),
      ),
    );
  }
}

class ContainerMovementExample extends StatefulWidget {
  @override
  _ContainerMovementExampleState createState() => _ContainerMovementExampleState();
}

class _ContainerMovementExampleState extends State<ContainerMovementExample> {
  Offset _offset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset += details.delta;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text('Drag me'),
              ),
            ),
          ),
        ),
        Positioned(
          left: _offset.dx + 150, // Adjusted position based on movement of the first container
          top: _offset.dy + 150, // Adjusted position based on movement of the first container
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
