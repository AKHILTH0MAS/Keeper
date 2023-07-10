import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/taskcomponets/textfieldtitle.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import '../providers/notesprovider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';

  Future<void> createUserWIthEmailAndPassword() async {
    try {
      Auth().createSignInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      log("${e.message}");
    }
  }

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Name",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Textfield(
                  titlecontroller: nameController,
                  keyboard: TextInputType.text,
                  hint: "Name"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Name",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Textfield(
                  titlecontroller: emailController,
                  keyboard: TextInputType.emailAddress,
                  hint: "Email"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              Textfield(
                titlecontroller: passwordController,
                hint: "password",
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      createUserWIthEmailAndPassword();
                      // addNameToDB();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: darkPrimay,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                child: Text(
                  "Already a user ->",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                errorMessage!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
