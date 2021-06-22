import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_settings.dart';

class About extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("About"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("This App Is Made Using:-"),
            Column(
              children: [
                Text("Firebase Authentication"),
                Text("Razorpay"),
                Text("Http dependency"),
                Text("Provider dependency")
              ],
            ),
            SizedBox(height: 20),
            Text("This App Contains These Widgets"),
            Column(
              children: [
                Text("AppBar"),
                Text("TextFormField"),
                Text("Asset Image"),
                Text("Drawer")
              ],
            )
          ],
        ),

      ),
    );
  }

}