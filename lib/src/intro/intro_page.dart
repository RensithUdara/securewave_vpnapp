import 'package:flutter/material.dart';
import 'package:vpn_app/src/constants.dart';
import 'package:vpn_app/src/intro/carousel_details.dart';
import 'package:vpn_app/src/vpn/vpn_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Map<String, dynamic>> items = Constants.slides;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Carousel(items: items),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: MaterialButton(
              minWidth: 180.0,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: const Color.fromARGB(255, 0, 94, 255), // Updated color
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => VpnPage(),
                  ),
                );
              },
              child: Text('GET STARTED'),
            ),
          )
        ],
      ),
    );
  }
}
