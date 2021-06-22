import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/screens/account_settings.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/account_settings.dart';

import '../payments.dart';
import 'edit_account_settings.dart';


class HomeScreen extends StatelessWidget {

  String data1 = "Saikat Mandal";

  static const routeName = '/home';

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
       Navigator.of(context).pop(exit(0));
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        //Navigator.of(context).pop(exit(0));
        //Navigator.of(context).pop();
        //Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //Navigator.of(context).pop(AlertDialog);
        Navigator.of(context, rootNavigator: true).pop('dialog');


      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
    //  title: Text("Simple Alert"),
      content: Text("Are you really want to exit?"),
      actions: [
        okButton, cancelButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog1(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("No updates available"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Logout '),
                Icon(Icons.logout)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
             // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              showAlertDialog(context);
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.amber,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    child: DrawerHeader(
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text("Welcome User", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.menu),
                    SizedBox(
                      width: 280,
                      child: InkWell(
                        onTap: () {
                         // Navigator.pushReplacementNamed(context, Accounts());
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Accounts()
                          ));
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text("Account"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(
                      width: 280,
                      child: InkWell(
                        onTap: () {
                          // Navigator.pushReplacementNamed(context, Accounts());
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PaymentScreen()
                          ));
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text("Payment"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 280,
                      child: InkWell(
                        onTap: () {
                          showAlertDialog1(context);
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text("Update"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 280,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => About()
                          ));

                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text("About"),
                        ),
                      ),

                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Welcome To Abstergo"),
            SizedBox(height: 50,),
            Image.asset('assets/abs.png')
          ],
        ),
      ),
  /*  floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => PaymentScreen()
            ));
          }
      ), */
    );
  }
}
