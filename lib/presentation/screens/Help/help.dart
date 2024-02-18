import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  Future<void> _launchDialPad(String phoneNumber) async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunch(telUri.toString())) {
      await launch(telUri.toString());
    } else {
      throw 'Could not launch ${telUri.toString()}';
    }
  }

  void _copyToClipboard(String text) {
    FlutterClipboard.copy(text).then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to clipboard'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Help Center'),
        backgroundColor: Colormanager.darkPrimary,//Color(0xffB7050A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width,

          child: Card(
            color: Colormanager.darkPrimary,//Color(0xffB7050A),
            child: Column(
              children: [
                Text('Contact us', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchDialPad('01885958754');
                      },
                      child: Column(
                        children: [
                          Text('  Contact us for any assistance or queries', style: TextStyle(fontSize: 13, color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '01885958754',
                              style: TextStyle(
                                color: Colors.black, // Make the number look like a link
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        _copyToClipboard('01885958754');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
