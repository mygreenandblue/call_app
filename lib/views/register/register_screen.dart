import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:call_app/views/login/login_screen.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'date_picker_widget.dart';
import 'package:call_app/views/register/date_picker_widget.dart';
import 'package:call_app/data_sources/api_services.dart';
import 'package:call_app/models/user.dart';
import 'package:call_app/views/register/button_widget.dart';

class SignUp extends StatefulWidget {
  User? user;
  SignUp({Key? key, this.user}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ButtonWidget date = ButtonWidget();
  String? _password;
  String? _name;
  String? _dateOfBirth;
  String? _confirmPassword;
  String? _account;
  String? _token;
  String? _phone;
  ApiService _apiService = ApiService();

  bool _isRegister = false;
  bool _isPressed = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool isRemember = false;

  TextEditingController _controllerAccount = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerDateOfBirth = TextEditingController();
  TextEditingController _controllerImagePath = TextEditingController();
  TextEditingController _controllerToken = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerConfirmPassword = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();

  @override
  void initState() {
    if (widget.user != null) {
      _controllerAccount.text = widget.user!.account!;
      _controllerPassword.text = widget.user!.password!;
      _controllerImagePath.text = widget.user!.image_path!;
      _controllerToken.text = widget.user!.token!;
      _controllerDateOfBirth.text = widget.user!.date_of_birth!;
      _controllerName.text = widget.user!.name!;
      _controllerConfirmPassword.text = widget.user!.password!;
    }
    super.initState();

    if (_account == null ||
        _password == null ||
        _name == null ||
        _phone == null) {
      _isPressed = true;
    } else {
      _isPressed = false;
    }
  }

  @override
  void dispose() {
    _controllerAccount.dispose();
    _controllerPassword.dispose();
    _controllerToken.dispose();
    _controllerImagePath.dispose();
    _controllerToken.dispose();
    _controllerDateOfBirth.dispose();
    _controllerName.dispose();
    _controllerConfirmPassword.dispose();
    super.dispose();
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  bool _checkPassword() {
    if (_confirmPassword != _password) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Create Account,",
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                    fontFamily: 'FredokaOne',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Sign up to get started!",
                style: TextStyle(fontSize: 22.0, color: Colors.grey),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            controller: _controllerName,
                            decoration: const InputDecoration(
                              hintText: "Full name",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _name = value,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                      const Icon(Icons.phone_outlined),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            maxLength: 15,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            controller: _controllerPhone,
                            decoration: const InputDecoration(
                              hintText: "Phone number",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _phone = value,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            onTap: () async {
                              CupertinoRoundedDatePicker.show(
                                context,
                                fontFamily: "Mali",
                                textColor: Colors.black,
                                initialDate: DateTime.now(),
                                minimumYear: 1900,
                                maximumYear: DateTime.now().year,
                                background: Colors.white,
                                borderRadius: 16,
                                initialDatePickerMode:
                                    CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() {
                                    _controllerDateOfBirth.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(newDateTime)
                                            .toString();
                                  });
                                },
                              );
                            },
                            controller: _controllerDateOfBirth,
                            decoration: const InputDecoration(
                              hintText: "Date of birth",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _dateOfBirth = value,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                      const Icon(Icons.image),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Picture",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            decoration: const InputDecoration(
                              hintText: "Account",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _account = value,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            decoration: const InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _password = value,
                            obscureText: _obscureText1,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _toggle1,
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.blue,
                          ))
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            controller: _controllerConfirmPassword,
                            obscuringCharacter: '*',
                            decoration: const InputDecoration(
                              hintText: " Confirm password",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _confirmPassword = value,
                            obscureText: _obscureText2,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _toggle2,
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.blue,
                          ))
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent, width: 1),
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
                            controller: _controllerToken,
                            decoration: const InputDecoration(
                              hintText: "Token",
                              border: InputBorder.none,
                            ),
                            onSaved: (value) => _token = value,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 32.0,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Color(0xffFA568F), Color(0xffFDA78F)],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    // if (_checkPassword() == false) {
                    setState(() => _isRegister = true);
                    String account = _controllerAccount.text;
                    String password = _controllerPassword.text;
                    String name = _controllerName.text;
                    String phone = _controllerPhone.text;
                    String dateOfBirth = _controllerDateOfBirth.text;

                    User user = User(
                      account: account,
                      password: password,
                      name: name,
                      phone_number: phone,
                    );
                    _apiService.fetchRegister(user).then((isSuccess) {
                      setState(() => _isRegister = false);
                      if (isSuccess) {
                        print("success");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        print("fail");
                      }
                    });
                    // } else {
                    //   print("object");
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           title: Text('Sai mật khẩu'),
                    //           content: Text('Các mật khẩu phải trùng khớp'),
                    //         );
                    //       });
                    // }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account, ",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
