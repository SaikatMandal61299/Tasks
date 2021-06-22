import 'package:flutter/material.dart';
import 'package:flutter_app210/newpage.dart';

void main() {
  runApp(MaterialApp(
debugShowCheckedModeBanner: false,
title: "Task 2",
home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Task 2"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {// do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.login,
              color: Colors.white,
            ),
            onPressed: () {// do something
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text("This is Burger Menu"),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                      ],
                    )
                )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Barry Allen"),
              subtitle: Text("barry123@xyz.com"),
              trailing: Icon(Icons.login),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Peter Parker"),
              subtitle: Text("peter123@abc.com"),
              trailing: Icon(Icons.login),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text("This is Network Image"),
            Image.network('https://th.bing.com/th/id/R5a53a1a9a9e283866600a36c7313e424?rik=%2fTjuASW%2fh5LhhA&riu=http%3a%2f%2fhtc-wallpaper.com%2fwp-content%2fuploads%2f2013%2f12%2fAndroid-2.jpg&ehk=YWBKZDI%2f3g49Wkh0NsxNT5Qbpa81aCl7DO0N%2fwkYyGM%3d&risl=&pid=ImgRaw',
            height: 200,
            width: 200,),
            SizedBox(height: 20,),
            Text("This is Local Image"),
            Image.asset("kidflash.jpg",
            height: 200,
            width: 200,),
            Row(
              children: [
                Icon(Icons.ac_unit),
                SizedBox(width: 50,),
                Icon(Icons.edit),
                SizedBox(width: 50,),
                Icon(Icons.settings)
              ],
            ),
        SizedBox(height: 20),
        TextField (
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Enter Name',
              hintText: 'Enter Your Name'
          ),
        ),
            RaisedButton(
              onPressed: () {},
              child: Text("Test"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              highlightColor: Colors.blue, //Replace with actual colors
              color: Colors.amber,
            ),
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.black,
              onPressed: (
                  ) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}