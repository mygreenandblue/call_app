import 'package:flutter/material.dart';

import 'package:call_app/views/register/register_screen.dart';
import 'package:call_app/views/user_screen/user_list_screen.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  bool _obscureText = true;
  bool isRemember = false;
  String? _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.person_pin,
                      size: 180,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black87,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "/FredokaOne"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 52.0,
            ),
            Center(
                child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  width: 120,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.call),
                        color: Colors.green,
                      ),
                      Text('Call')
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  width: 120,
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.video_call_sharp),
                        color: Colors.green,
                      ),
                      Text('Video call')
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
