import 'package:flutter/material.dart';
import 'package:call_app/data_sources/api_services.dart';
import 'package:call_app/models/user.dart';

class UserListViewModel with ChangeNotifier{

  List<User> userList = [];

  fetchUserList() async {
    // this.userList  = await ApiServices().fetchUser();
    notifyListeners();
  }

}