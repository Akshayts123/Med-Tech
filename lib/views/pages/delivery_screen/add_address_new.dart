


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddressNew extends StatefulWidget {
  const AddAddressNew({Key? key}) : super(key: key);

  @override
  State<AddAddressNew> createState() => _AddAddressNewState();
}
List<String> addresses = [
  "123 Main Street 456 Elm Street 789 Oak Street",
];

class _AddAddressNewState extends State<AddAddressNew> {
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          ElevatedButton(
            onPressed: () async {
              final address = _addressController.text;
              if (address.isNotEmpty) {
                addresses.add(address);
                await saveAddresses(addresses);
                setState(() {
                  _addressController.text = '';
                });
              }
            },
            child: Text('Add Address'),
          ),

        ],
      ),
    );
  }


}
Future<void> saveAddresses(List<String> addresses) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('addresses', addresses);
}
Future<List<String>> getAddresses() async {
  final prefs = await SharedPreferences.getInstance();
  final addresses = prefs.getStringList('addresses') ?? [];
  return addresses;
}
class AddressListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getAddresses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final addresses = snapshot.data;
          return ListView.builder(
            itemCount: addresses?.length,
            itemBuilder: (context, index) {
              final address = addresses![index];
              return ListTile(
                title: Text(address),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class MyAppAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Address List'),
        ),
        body: Column(
          children: [
            AddAddressNew(),
            Expanded(child: AddressListWidget()),
        // Container(
        //   height: 200,
        //   child: ListView.builder(
        //     itemCount: addresses?.length,
        //     itemBuilder: (context, index) {
        //       final address = addresses![index];
        //       return ListTile(
        //         title: Text(address),
        //       );
        //     },
        //   ),
        // ),
          ],
        ),
      ),
    );
  }
}