
import 'package:flutter/material.dart';

class container extends StatefulWidget {
  const container({super.key});

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Widget"),
      ),

      body: Center(
        // child: Container(
        //   width: 100,
        //   height: 100,
        //   color: Colors.pink,
        //   child: Text("Hello World",
        //     style: TextStyle(
        //       color: Colors.pink,
        //       fontSize: 22,
        //       fontWeight: FontWeight.w600,
        //       backgroundColor: Colors.orangeAccent,
        //     ),
        //   ),
        // ),
        child: TextButton(
            onPressed: (){
              print("Text Button Tapped!");
            },
            onLongPress: (){
              print("Text Button is Pressed Long");
            },
            child: Text("Click Here!"),
        ),
      ),
    );
  }
}
