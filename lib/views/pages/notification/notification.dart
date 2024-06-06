

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends StatelessWidget {
   Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Notification", style: Theme.of(context).textTheme.titleSmall),
        actions: [
          Text("Clear All"),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
