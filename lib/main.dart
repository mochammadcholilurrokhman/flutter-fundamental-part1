import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/image_widget.dart';
import 'package:hello_world/basic_widgets/text_widget.dart';
import 'dart:async';

void main() => runApp(const MyApp());

// Langkah 6
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Date Picker',
      home: MyHomePage(title: 'Contoh Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => {
                _selectDate(context),
                // ignore: avoid_print
                print(selectedDate.day + selectedDate.month + selectedDate.year)
              },
              child: const Text('Pilih Tanggal'),
            ),
          ],
        ),
      ),
    );
  }
}
// Langkah 5
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: const Text('Contoh TextField')),
//           body: const TextField(
//             obscureText: false,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Nama',
//             ),
//           )),
//     );
//   }
// }
// Langkah 4
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: MyLayout(),
//       ),
//     );
//   }
// }

// class MyLayout extends StatelessWidget {
//   const MyLayout({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         child: const Text('Show Alert'),
//         onPressed: () {
//           showAlertDialog(context);
//         },
//       ),
//     );
//   }
// }

// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: const Text("My title"),
//     content: const Text("This is my message."),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
//}
