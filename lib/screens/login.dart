import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/screens/forgot_password.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/taskcomponets/textfieldtitle.dart';
import 'package:provider/provider.dart';
import '../providers/notesprovider.dart';

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
      backgroundColor: isDarkTheme ? darkThemeB : primaryColor,
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
              Center(
                child: Text(
                  "Login Now",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enter your email",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              Textfield(
                titlecontroller: userNameController,
                hint: "username@gmail.com",
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                        color: isDarkTheme ? darkPrimay : primaryBColor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        )),
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                isDarkTheme ? darkTexttheme : primaryTexttheme,
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/register'),
                    child: Text(
                      "Not a user?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                isDarkTheme ? darkTexttheme : primaryTexttheme,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
