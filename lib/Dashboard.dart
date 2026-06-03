import 'package:first_demo_project/models/user.dart';
import 'package:first_demo_project/widgets/Custom_Container_Widget.dart';
import 'package:first_demo_project/widgets/User_Detailed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List users = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/users'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        setState(() {
          users = data['users'];
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text("Demo Cards Page"),
      ),
      body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : error != null
                      ? Center(child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Text(error!, style: const TextStyle(color: Colors.red, fontSize: 16)),
                      ))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final userMap = users[index];
                        final user = UserElement.fromJson(userMap);
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDetailed(user: user),
                                  ),
                                );
                              },
                              child: CustomContainerWidget(
                                imagePath: user.image,
                                title: '${user.firstName} ${user.lastName}',
                                address: user.address.address,
                                username: user.username,
                                email: user.email,
                                number: user.phone,
                                age: user.age.toString(),
                                aim: user.company.title,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
      ),
    );
  }
}
