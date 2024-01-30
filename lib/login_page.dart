import 'package:flutter/material.dart';
import '/products_page.dart';
import 'package:lottie/lottie.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

bool validateForm() {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
    print('Email is incorrect');
    return false;
  } else if (passwordController.text.length < 4) {
    print('Password is wrong');
    return false;
  } else {
    return true;
  }
}

void performLogin(BuildContext context) {
  if (validateForm()) {
    const String email = 'demo@gmail.com';
    const String password = '11111';
    if (emailController.text == email && passwordController.text == password) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductsPage(),
      ));
    } else {
      print('Wrong credentials');
    }
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: [
          Lottie.network(
              'https://lottie.host/9d5f1eb5-b95b-4360-a3d2-aa21050deb79/ljXdFym0I2.json',
              height: 200),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          Container(height: 30),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          Container(height: 30),
          ElevatedButton(
              onPressed: () {
                performLogin(context);
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
