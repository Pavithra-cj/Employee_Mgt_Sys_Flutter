import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xff0288d1);

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          isKeyboardVisible
              ? SizedBox(
                  height: screenHeight / 20,
                )
              : Container(
                  height: screenHeight / 2.5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth / 5,
                    ),
                  ),
                ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 20,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: screenWidth / 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldTitle("Username"),
                customField("Username", userController, false),
                fieldTitle("Password"),
                customField("Password", passController, true),
                Container(
                  height: 60,
                  width: screenWidth,
                  margin: EdgeInsets.only(top: screenHeight / 40),
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: screenWidth / 26,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget fieldTitle(String text) {
    return (Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth / 26,
          fontFamily: 'OpenSans',
        ),
      ),
    ));
  }

  Widget customField(
      String hint, TextEditingController controller, bool obscure) {
    return (Container(
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth / 6,
            child: Icon(
              obscure ? Icons.lock : Icons.person,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: screenWidth / 12),
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight / 35,
                ),
                border: InputBorder.none,
                hintText: hint,
              ),
              maxLines: 1,
              obscureText: obscure,
            ),
          ))
        ],
      ),
    ));
  }
}
