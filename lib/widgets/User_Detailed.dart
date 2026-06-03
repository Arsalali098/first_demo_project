import 'package:first_demo_project/src/controller/user_controller.dart';
import 'package:first_demo_project/src/repo/user_repo.dart';
import 'package:flutter/material.dart';

class UserDetailed extends StatefulWidget {
  const UserDetailed({super.key});

  @override
  State<UserDetailed> createState() => _UserDetailedState();
}

class _UserDetailedState extends State<UserDetailed> {
  @override
  Widget build(BuildContext context) {
    UserRepo().getUsers();
    // Media Queries
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      // Appbar Start
      appBar: AppBar(
        title: const Text("User Details",
          style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFFffedf3),
        foregroundColor: Color(0xFF373757),
      ),
      // Appbar End

      // Body Start
      body: FutureBuilder(
          future: UserController().getUsers(),
          builder: (context, snapshot){
            snapshot.data;

            if(snapshot.data == null){
              return const Center(child: CircularProgressIndicator(),);
            }
          return Container();
          }
      ),
    );
  }
}
