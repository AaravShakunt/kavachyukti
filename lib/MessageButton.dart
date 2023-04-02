import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'contactManager.dart';
import 'package:http/http.dart';

class MessageButton extends StatelessWidget {
  // final List<String> numbers;
  // final String message;
  late ContactManager CM;

  MessageButton(this.CM);

  void sendMessage() async {
    String location = await CM.getGoogleMapsUrlWithCurrentLocation();
    String message = "I am in danger, please help me at $location";
    TwilioFlutter twilioFlutter;
    print("hello");
    for (int i = 0; i < CM.numbers.length; i++) {
      twilioFlutter = TwilioFlutter(
          accountSid:
              'ACca6fe7e468cd967f884bc13888497586', // replace *** with Account SID
          authToken:
              '419bf912b9a244938ccca336b6a27d3f', // replace xxx with Auth Token
          twilioNumber: '+15856693840' // replace .... with Twilio Number
          );
      String number = CM.numbers[i];
      print("hello");

      twilioFlutter.sendSMS(toNumber: '+91$number', messageBody: '$message');
      String sheetyAPIKey =
          "https://api.sheety.co/5c07af29f24e4ee2805173c33495bfa4/womensSafety/sheet1";
      // var url = Uri.https(sheetyAPIKey, 'whatsit/create');
      //   var response =
      //       await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: sendMessage,
      child: Text('Send Message'),
    );
  }
}
