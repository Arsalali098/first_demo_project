import 'dart:convert';
import 'package:first_demo_project/models/user.dart';
import 'package:first_demo_project/src/repo/user_repo.dart';

class UserController {
  final userRepo = UserRepo();

  Future<List<User>> getUsers() async {
    final response = await userRepo.getUsers();
    if (response.statusCode != 200) {
      throw Exception('Failed to load users');
    }
    final data = jsonDecode(response.body);
    List<User> users = [];
    final usersJson = data['users'];

    for(dynamic userJson in usersJson){
      users.add(User.fromJson(userJson));
    }
    return users;
  }
}