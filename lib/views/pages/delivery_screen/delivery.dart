import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'address.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  List<Address> addresses = [];

  void _addAddress() {
    if (_formKey.currentState!.validate()) {
      Address newAddress = Address(
        street: _streetController.text,
        city: _cityController.text,
        state: _stateController.text,
        postalCode: _postalCodeController.text,
      );
      setState(() {
        addresses.add(newAddress);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {

                    Address address = addresses[index];
                    return ListTile(
                      title: Text("${address.street}, ${address.city}, ${address.state} ${address.postalCode}"),
                    );
                  },
                ),
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(labelText: "Street"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a street";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: "City"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a city";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(labelText: "State"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a state";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(labelText: "Postal Code"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a postal code";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                // onPressed: _addAddress,
                onPressed: (){
                  Get.to(MyAdresses());
                },
                child: Text("Add Address"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Address {
  final String street;
  final String city;
  final String state;
  final String postalCode;

  Address({required this.street, required this.city, required this.state, required this.postalCode});
}
