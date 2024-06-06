import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otpless_flutter/otpless_flutter.dart';

class OtpLess extends StatefulWidget {
  const OtpLess({super.key});

  @override
  State<OtpLess> createState() => _OtpLessState();
}

class _OtpLessState extends State<OtpLess> {
  Map<String, dynamic>? _userDetails;
  final _otplessFlutterPlugin = Otpless();

  Future<void> verifyWaid({required String? waId}) async {
    try {
      Map<String, String?> requestBody = {"waId": waId};
      Map<String, String> headers = {
        "clientId": "clientId from otpless",
        "clientSecret": "clientSecretfrom otpless",
        "Content-Type": "application/json"
      };
      String url = "https://example.authlink.me";
      await http
          .post(Uri.parse(url),
          headers: headers, body: json.encode(requestBody))
          .then((response) {
        Logger().i(response.body);
        setState(() {
          _userDetails = json.decode(response.body);
        });
      });
    } catch (error) {
      Logger().e(error);
    }
  }

  void initiateWhatsappLogin(String intentUrl) async {
    try {
      var result =
      await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
      Logger().i(result);
    } catch (error) {
      Logger().e(error);
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) async {
      await verifyWaid(waId: token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            "Otpless Example",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Expanded(
              child: SizedBox(),
            ),
            _userDetails == null
                ? const SizedBox()
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "status-code : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _userDetails!['statusCode'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "user-name : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _userDetails!['data']['userName'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "user-whatsapp-number : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "+${_userDetails!['data']['userMobile']}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "user-waid : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "+${_userDetails!['user']['waId']}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    initiateWhatsappLogin(
                      "https://example.authlink.me?redirectUri=otpless://example",
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              "Login via WhatsApp",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            // Icon(
                            //   size: 30,
                            //   color: Colors.green,
                            //   // Icons.whatsapp_outlined,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}