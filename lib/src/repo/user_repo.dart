
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserRepo {
  Future<http.Response> getUsers() async{
    final url = Uri.parse('https://dummyjson.com/users');
    final response = await http.get(url);
    log(response.body.toString());
    return response;
  }
}