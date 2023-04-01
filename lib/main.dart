import 'package:contactstry/MessageButton.dart';
import 'package:flutter/material.dart';
import 'contactManager.dart';
import 'contactView.dart';
import 'package:shake/shake.dart';
import 'MessageButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContactManager CM = new ContactManager();

  @override
  @override
  late int ctr;
  void initState() {
    ctr = 0;
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        print("shake $ctr");
        ctr++;
        if (ctr == 3) {
          CM.sendMessage();
          ctr = 0;
        }
        // Do stuff on phone shake
      },
      shakeThresholdGravity: 7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MessageButton(CM),
              contactView(CM: CM),
            ],
          ),
        ),
      ),
    );
  }
}
