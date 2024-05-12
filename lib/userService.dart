import 'package:api_ornek_hackathon/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String url = "https://reqres.in/api/users?page=2";
  Future<UserModel?> fetchUsers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200 || res.statusCode == 201) {
      var jsonBody = UserModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("Bir hata oluştu => ${res.statusCode}");
    }
  }
}
