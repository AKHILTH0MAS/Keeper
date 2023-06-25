import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/notescomponents/auth.dart';
import 'package:notes/notescomponents/textfieldtitle.dart';
import 'package:provider/provider.dart';
import '../notescomponents/notesprovider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  Future<void> signInWithEmailandPassword() async {
    try {
      Auth().signInWithEmailAndPassword(
          email: userNameController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Login Now...!",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enter your email",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Textfield(
                titlecontroller: userNameController,
                hint: "Enter your email",
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Password",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
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
                      Auth().signInWithEmailAndPassword(
                          email: userNameController.text,
                          password: passwordController.text);
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: darkPrimay,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color:
                                isDarkTheme ? darkTexttheme : primaryTexttheme),
                      ),
                    ),
                  ),
                ],
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
