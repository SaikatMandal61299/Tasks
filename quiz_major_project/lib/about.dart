import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("About"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Colors.transparent,
                ]
            )
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text("This App Is Made By: Saikat Mandal"),
              SizedBox(height: 20),
              Text("This App Is Made Using:-"),
              SizedBox(height: 20),
              Column(
                children: [
                  Text("Flutter Toast"),
                  Text("Opentrivia Database API"),
                  Text("WillPopScope Widget"),
                  Text("ClipperPath"),
                  Text("Stack"),
                  Text("AppBar"),
                  Text("TextFormField"),
                  Text("Asset Image"),
                  Text("Drawer"),
                  Text("And Many Other Widgets")
                ],
              ),
              SizedBox(height: 40,),
              Text("References Taken From:-"),
              SizedBox(height: 20),
              Text("Geeksforgeeks"),
              Text("Tutorialspoint"),
              Text("Youtube"),
              Text("Javapoint"),
              Text("And Few Others")
            ],
          ),

        ),
      ),
    );
  }

}