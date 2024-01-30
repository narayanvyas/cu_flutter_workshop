import 'package:flutter/material.dart';
import '/products_page.dart';
import 'package:lottie/lottie.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isShowPassword = false;
bool validateForm(BuildContext context) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Email is wrong'),
      backgroundColor: Colors.red,
    ));

    return false;
  } else if (passwordController.text.length < 4) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password is wrong'),
      backgroundColor: Colors.red,
    ));
    return false;
  } else {
    return true;
  }
}

void performLogin(BuildContext context) {
  if (validateForm(context)) {
    const String email = 'demo@gmail.com';
    const String password = '11111';
    if (emailController.text == email && passwordController.text == password) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductsPage(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Wrong Credentials'),
        backgroundColor: Colors.red,
      ));
    }
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            obscureText: !isShowPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye)),
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
