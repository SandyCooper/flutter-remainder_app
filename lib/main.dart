import 'package:flutter/material.dart';
import 'package:flutter_remainder_app/data/local_notification.dart';
import 'package:flutter_remainder_app/screen/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeSceen(),
      // home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late OverlayEntry overlayEntry;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Remainder App'),
//       ),
//       body: Overlay(
//         initialEntries: [
//           OverlayEntry(
//             builder: (context) => YourOverlayWidget(),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showTimePickerOverlay();
//         },
//         child: Icon(Icons.access_time),
//       ),
//     );
//   }

//   void showTimePickerOverlay() {
//     overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: 100.0, // Adjust the position as needed
//         child: YourTimePickerWidget(),
//       ),
//     );

//     Overlay.of(context).insert(overlayEntry);
//   }
// }

// class YourOverlayWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black.withOpacity(0.5),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Center(
//         child: Text('Your Overlay Widget'),
//       ),
//     );
//   }
// }

// class YourTimePickerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(16.0),
//       child: Text("hello"),
//     );
//   }
// }
