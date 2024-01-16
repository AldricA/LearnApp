import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LearnApp/screens/dashboardpage.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLogin() {
    // Connexion
    final username = usernameController.text;
    final password = passwordController.text;
    print('Username: $username, Password: $password');

    //Get to dashboard if auth true
    Get.to(() => DashboardPage());

  }

  void onSignUp() {
    // Sign Up + Get to Sign Up Screen
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: loginController.usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    fillColor: Colors.lightBlue[50],
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: Colors.lightGreen[50],
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loginController.onLogin,
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
                TextButton(
                  onPressed: loginController.onSignUp,
                  child: const Text('Sign Up'),
                  style: TextButton.styleFrom(primary: Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
