import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/tinder.png",
                      height: 150,
                      width: 150,
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Text(
                      "Location Changer",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    Container(
                      height: 10.0,
                    ),
                    Text(
                      "Plugin app for Tinder",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Container(
                      height: 30.0,
                    ),
                    Material(
                      child: FlatButton(
                        color: Colors.white,
                        height: 50.0,
                        onPressed: () {},
                        child: Text(
                          "Login with Facebook",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 20.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                      borderRadius: BorderRadius.circular(46.0),
                      elevation: 20,
                      shadowColor: Color(0xFFFF8C3B),
                    )
                  ],
                ),
              ))),
    );
  }
}
