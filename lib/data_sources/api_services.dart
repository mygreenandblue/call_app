import 'dart:async';
import 'dart:convert';
// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_urls.dart';
import 'package:call_app/models/user.dart';

class ApiService {
  // Future<List<Profile>> getProfiles() async {
  //   final response = await client.get("$baseUrl/api/profile");
  //   if (response.statusCode == 200) {
  //     return profileFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

  Future<int> fetchLogin(User data) async {
    final url = Uri.parse(
        '${ApiUrls.baseUrl}/login?account=${data.account}&password=${data.password}');
    var map = new Map<String, dynamic>();
    map['Account'] = data.account;
    map['Password'] = data.password;
    final response = await http.post(
      url,
      body: map,
    );

    String responseBody = response.body;
    int statusCode = response.statusCode;

    switch (statusCode) {
      case 1:
        statusCode = 200;
        break;
      case 2:
        statusCode = 401;
        break;
      default:
    }
    return statusCode;
  }

  Future<bool> fetchRegister(User data) async {
    final url = Uri.parse(
        '${ApiUrls.baseUrl}/register?name=${data.name}&phone_number=${data.phone_number}&account=${data.account}&password=${data.password}&image_path=${data.image_path}&date_of_birth=${data.date_of_birth}&token=${data.token}');
    var map = new Map<String, dynamic>();
    map['Account'] = data.account;
    map['Password'] = data.password;
    map['name'] = data.name;
    map['phone_number'] = data.phone_number;
    map['image_path'] = "";
    map['date_of_birth'] = "";
    map['token'] = "";

    final response = await http.post(
      url,
      body: map,
    );
    String responseBody = response.body;
    int statusCode = response.statusCode;
    print("$responseBody");
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> deleteProfile(int id) async {
  //   final response = await client.delete(
  //     "$baseUrl/api/profile/$id",
  //     headers: {"content-type": "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
