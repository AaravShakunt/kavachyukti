import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class VoiceDetectionClass extends StatelessWidget {
  const VoiceDetectionClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(
        title: 'Women\'s Safety App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and say "wait" to make an emergency call.';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await _speech.initialize();
  }

  Future<void> _makeEmergencyCall() async {
    stopListening();
    const phoneNumber = '+917004939484';
    if (await Permission.phone.request().isGranted) {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } else {
      await Permission.phone.request();
      if (await Permission.phone.isGranted) {
        await FlutterPhoneDirectCaller.callNumber(phoneNumber);
      } else {
        throw 'Permission to access the phone is not granted.';
      }
    }
  }

  bool containsHelp(String str) {
    return str.toLowerCase().contains('wait');
  }

  void startListening() {
    _isListening = true;
    _speech.listen(
      onResult: (result) {
        setState(() {
          _text = result.recognizedWords;
          print(_text);
        });
        if (containsHelp(_text) == true) {
          print(containsHelp(_text));
          _makeEmergencyCall();
        }
      },
    );

    setState(() {
      _isListening = true;
    });
  }

  void stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        //actions: <Widget>[],
      ),
      backgroundColor: Colors.blueGrey[400],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isListening ? Colors.red : Colors.blue,
        onPressed: () {
          if (_isListening) {
            stopListening();
          } else {
            startListening();
          }
        },
        child: Icon(
          _isListening ? Icons.mic : Icons.mic_none,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: const TextStyle(fontSize: 32, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}
