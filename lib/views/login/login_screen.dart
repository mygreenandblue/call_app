import 'dart:ffi';

import 'package:call_app/models/user.dart';
import 'package:flutter/material.dart';
import 'fade_animation.dart';
import 'package:call_app/views/register/register_screen.dart';
import 'package:call_app/views/user_screen/user_list_screen.dart';
import 'package:call_app/data_sources/api_services.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Login extends StatefulWidget {
  User? user;
  Login({Key? key, this.user}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _isRemember = false;
  String? _password;
  String? _account;
  ApiService _apiService = ApiService();
  bool _isLogin = false;

  TextEditingController _controllerAccount = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('AlertDialog Title'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: const <Widget>[
  //               Text('This is a demo alert dialog.'),
  //               Text('Would you like to approve of this message?'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  bool _isPressed = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    if (widget.user != null) {
      _controllerAccount.text = widget.user!.account!;
      _controllerPassword.text = widget.user!.password!;
    }

    if (_account == null || _password == null) {
      _isPressed = true;
    } else {
      _isPressed = false;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controllerAccount.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Column(
                      children: [
                        const FadeAnimation(
                            2,
                            Icon(
                              Icons.person_pin,
                              size: 100,
                              color: Colors.grey,
                            )),
                        const FadeAnimation(
                          2,
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black87,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontFamily: "/FredokaOne"),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        const FadeAnimation(
                          2,
                          Text(
                            "Sign in to continue",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.grey,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontFamily: "/FredokaOne"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 52.0,
                ),
                FadeAnimation(
                  2,
                  Container(
                      width: double.infinity,
                      height: 70,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.pinkAccent, width: 1),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.pinkAccent,
                                blurRadius: 10,
                                offset: Offset(1, 1)),
                          ],
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.person),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _controllerAccount,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Account',
                                  border: InputBorder.none,
                                ),
                                onSaved: (value) => _account = value,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                FadeAnimation(
                  2,
                  Container(
                      width: double.infinity,
                      height: 70,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.pinkAccent, width: 1),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.pinkAccent,
                                blurRadius: 10,
                                offset: Offset(1, 1)),
                          ],
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.lock),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _controllerPassword,
                                obscuringCharacter: '*',
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: " Password",
                                  border: InputBorder.none,
                                ),
                                onSaved: (value) => _password = value,
                                obscureText: _obscureText,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: _toggle,
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.blue,
                              ))
                        ],
                      )),
                ),
                FadeAnimation(
                  2,
                  Row(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Checkbox(
                              value: _isRemember,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  _isRemember = value!;
                                });
                              }),
                          Text(
                            "Remember account",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  2,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        colors: [Color(0xffFA568F), Color(0xffFDA78F)],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() => _isLogin = true);
                        String account = _controllerAccount.text;
                        String password = _controllerPassword.text;

                        User user = User(account: account, password: password);
                        if (widget.user == null) {
                          _apiService.fetchLogin(user).then((isSuccess) {
                            setState(() => _isLogin = false);
                            if (isSuccess == 200) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserListScreen()));
                            } else if (isSuccess == 401) {
                              print("asd");
                            } else {
                              print("object");
                            }
                          });
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontFamily: "FredokaOne"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                FadeAnimation(
                  2,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account,",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
