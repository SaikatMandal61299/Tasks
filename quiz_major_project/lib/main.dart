import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quiz_major_project/about.dart';
import 'package:quiz_major_project/ui/pages/home.dart';
import 'package:quiz_major_project/ui/pages/login_screen.dart';
import 'package:quiz_major_project/ui/pages/signup_screen.dart';

import 'models/authentication.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Trivia',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.deepOrange,
          fontFamily: "Montserrat",
          buttonColor: Colors.amber,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary
          )
      ),
      home: HomePage(),
    );
  }
}

class Welcome extends StatelessWidget {

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MyApp()
        ));
        Navigator.of(context, rootNavigator: true).pop('dialog');
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
      content: Text("Are you really want to logout?"),
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



  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Are you really want to exit?"),
        actions: [
          FlatButton(onPressed: ()=> Navigator.pop(context, false), child: Text("NO")),
          FlatButton(onPressed: ()=> Fluttertoast.showToast(msg: "Logout to exit").whenComplete(() => Navigator.pop(context)), child: Text("YES"),),
        ],
      )
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Quiz Page'),
              elevation: 0,
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
                                    builder: (context) => About()
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

                    ],
                  )

                ],
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Image.asset('assets/quiz.png', height: 250, width: 250,),
                  SizedBox(height: 20,),
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => MyApp2()
                      ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                    child: Text(
                      "Start Quiz ->",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: OptionScreen(),
        routes: {
          SignupScreen.routeName: (ctx)=> SignupScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),

        },
      ),
    );
  }
}

class LogScrn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx)=> SignupScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),

        },
      ),
    );
  }
}

class SignScrn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: SignupScreen(),
        routes: {
          SignupScreen.routeName: (ctx)=> SignupScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),
        },
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Colors.purple,
                ]
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: new Image.asset('assets/abs.png'),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LogScrn()
                    ));
                  },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Login"),
                ),

              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SignScrn()
                    ));
                  },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
