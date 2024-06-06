import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_address_new.dart';

class MyAdresses extends StatefulWidget {
  @override
  _MyAdressesState createState() => _MyAdressesState();
}

class _MyAdressesState extends State<MyAdresses> {
  final TextEditingController _addressController = TextEditingController();

  String _savedAddress = "";

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  _loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedAddress = prefs.getString('address');
    setState(() {
      _savedAddress = (savedAddress ?? '');
    });
  }

  _saveAddress(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('address', address);
    setState(() {
      _savedAddress = address ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add and Display Address'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // _saveAddress(_addressController.text);
                Get.to(MyAppAddress());
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Saved Address:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),

            Text(_savedAddress ?? 'No address saved'),
            // Container(

            //   height: 200,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: _savedAddress.length,
            //     itemBuilder: (context, index) {
            //      return Text(_savedAddress[index] ?? 'No address saved');
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
