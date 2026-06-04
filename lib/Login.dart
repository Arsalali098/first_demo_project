import 'package:first_demo_project/Dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool isPassObscure = true;
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  static const String KEYLOGIN = "Login";
  static const String KEYNAME = 'name';
  final FocusScopeNode currentFocus = FocusScopeNode();

  @override
  void initState() {
    super.initState();
    getValue();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login", style: TextStyle(fontSize: 33)),
                TextFormField(
                  controller: nameController,
                  focusNode: currentFocus,
                  onTapOutside: (_) {
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Username';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  obscureText: isPassObscure,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPassObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPassObscure = !isPassObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: 300.0,
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        var name = nameController.text.toString();
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setString(KEYNAME, name);

                        // If successfully Logged in (cred are correct)
                        var sharedprefrence =
                            await SharedPreferences.getInstance();
                        sharedprefrence.setBool(KEYLOGIN, true);

                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6588f0),
                        foregroundColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        shadowColor: Colors.grey,
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Signup',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("You tapped");
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    if (getName != null) {
      setState(() {
        nameController.text = getName;
      });
    }
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedin = sharedPref.getBool(KEYLOGIN);
    if (isLoggedin != null) {
      if (isLoggedin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    }
  }
}
