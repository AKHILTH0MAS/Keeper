import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/taskcomponets/textfieldtitle.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import '../providers/notesprovider.dart';
import '../services/db.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';
  void addUsernametoDB() {
    DB().createUser(nameController.text);
  }

  Future<void> createUserWIthEmailAndPassword() async {
    try {
      await Auth().createSignInWithEmailAndPassword(
          email: emailController.text, password: passwordController1.text);
      addUsernametoDB();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();

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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Name",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              Textfield(
                titlecontroller: nameController,
                keyboard: TextInputType.text,
                hint: "Akhil Thomas",
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Email",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      ),
                ),
              ),
              Textfield(
                  titlecontroller: emailController,
                  keyboard: TextInputType.emailAddress,
                  hint: "Akhil123@gmail.com"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Password",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                        )),
              ),
              Textfield(
                titlecontroller: passwordController1,
                hint: "password",
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Confirm Password",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                        )),
              ),
              Textfield(
                titlecontroller: passwordController2,
                hint: "password",
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 20),
              if (errorMessage != null) ...[
                Text(
                  errorMessage!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ],
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (nameController.text.isEmpty) {
                        setState(() {
                          errorMessage = "Name cannot be empty";
                        });
                      } else if (emailController.text.isEmpty) {
                        setState(() {
                          errorMessage = "Email cannot be empty";
                        });
                      } else if (passwordController1.text.isEmpty) {
                        setState(() {
                          errorMessage = "Password cannot be empty";
                        });
                      } else if (passwordController2.text.isEmpty) {
                        setState(() {
                          errorMessage = "Confirm Password cannot be empty";
                        });
                      } else if (passwordController1.text.length < 6) {
                        setState(() {
                          errorMessage =
                              "Password must be atleast 6 characters";
                        });
                      } else if (passwordController1.text !=
                          passwordController2.text) {
                        setState(() {
                          errorMessage = "Password does not match";
                        });
                      } else {
                        createUserWIthEmailAndPassword();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDarkTheme ? darkPrimay : primaryBColor,
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
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: Text(
                      "Already a user",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                isDarkTheme ? darkTexttheme : primaryTexttheme,
                          ),
                    ),
                  ),
                ],
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
