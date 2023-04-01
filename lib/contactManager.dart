import 'package:geolocator/geolocator.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class ContactManager {
  late List<String> numbers;
  late List<Map<String, String>> data;

  ContactManager() {
    data = [
      {
        "name": "Aarav",
        "number": "7982629111",
      },
      // {
      //   "name": "Neeraj",
      //   "number": "9920476343",
      // },
    ];
    numbers = [];
    for (int i = 0; i < data.length; i++) {
      numbers.add(data[i]["number"]!);
    }
  }

  void sendMessage() async {
    String location = await this.getGoogleMapsUrlWithCurrentLocation();
    String message = "I am in danger, please help me at $location";
    TwilioFlutter twilioFlutter;
    for (int i = 0; i < this.numbers.length; i++) {
      twilioFlutter = TwilioFlutter(
          accountSid:
              'ACca6fe7e468cd967f884bc13888497586', // replace *** with Account SID
          authToken:
              '419bf912b9a244938ccca336b6a27d3f', // replace xxx with Auth Token
          twilioNumber: '+15856693840' // replace .... with Twilio Number
          );
      String number = this.numbers[i];

      twilioFlutter.sendSMS(toNumber: '+91$number', messageBody: '$message');
      String sheetyAPIKey =
          "https://api.sheety.co/5c07af29f24e4ee2805173c33495bfa4/womensSafety/sheet1";
      var url = Uri.https(sheetyAPIKey, 'whatsit/create');
      //   var response =
      //       await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    }
  }

  void add_Contact(String name, String number) {
    data.add({"name": name, "number": number});
    numbers.add(number);
  }

  Future<String> getGoogleMapsUrlWithCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    String baseUrl = 'https://www.google.com/maps/search/?api=1&query=';
    String latLngString = '';

    // Get current location
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latLngString = '${position.latitude},${position.longitude}';
      String mapsUrl = baseUrl + latLngString;
      print(mapsUrl);
      //print("HELLO");
      return mapsUrl;
    } catch (e) {
      print(e);
      print("UNABLE TO FETCH LOCATION");
      return ("UNABLE TO FETCH LOCATION");
    }
    //return ("UNABLE TO FETCH LOCATION");
  }
}
