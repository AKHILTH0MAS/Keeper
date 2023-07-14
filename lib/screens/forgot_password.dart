import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../providers/notesprovider.dart';
import '../services/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? errorMessage = '';

  Future<void> resetPassWord(String email) async {
    try {
      await Auth().resetPassword(email);
      setState(() {
        errorMessage = 'Email sent';
      });
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
        errorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
        backgroundColor: isDarkTheme ? darkThemeB : primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: isDarkTheme ? darkTexttheme : primaryTexttheme,
            ),
          ),
          backgroundColor: isDarkTheme ? darkThemeB : primaryColor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter your email address and we will send you a link to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    ),
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    resetPassWord(emailcontroller.text);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? darkPrimay : primaryBColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color:
                              isDarkTheme ? darkTexttheme : primaryTexttheme),
                    ),
                  ),
                ),
                if (errorMessage != null) ...[
                  Text(
                    errorMessage!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ],
                if (Auth.confirmationemailsent) ...[
                  Text(
                    "Password reset link has sent to your email",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ));
  }
}
