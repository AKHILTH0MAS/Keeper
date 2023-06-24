import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/notescomponents/textfieldtitle.dart';
import 'package:provider/provider.dart';
import '../notescomponents/notesprovider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Username",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Textfield(titlecontroller: userNameController, hint: "Username"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Password",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Textfield(titlecontroller: passwordController, hint: "password"),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: darkPrimay,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color:
                              isDarkTheme ? darkTexttheme : primaryTexttheme),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.facebook,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.soap,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
