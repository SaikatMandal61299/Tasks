import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/edit_account_settings.dart';

class Accounts extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(height: 10,)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      child: Text("Name: Barry Allen", style: TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(
                      child: Text("Father Name: Henry Allen", style: TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(
                      child: Text("Mother Name: Nora Allen", style: TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(
                      child: Text("Address: Central City", style: TextStyle(fontSize: 25),),
                    )
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SizedBox(
                      child: Text("Occuipation: Crime Scene Investigator", style: TextStyle(fontSize: 25),),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
          label: Text("Edit Details"),
          icon: Icon(Icons.edit),
          onPressed: () {}
      ),
      );

  }


}