import 'package:digital_note/auth/forget_password_page.dart';
import 'package:digital_note/auth/google_sign_in.dart';
import 'package:digital_note/auth/my_button.dart';
import 'package:digital_note/auth/my_textfield.dart';
import 'package:digital_note/auth/square_tile.dart';
import 'package:digital_note/home_screen.dart';
import 'package:digital_note/pay/pay_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  final Function()? onTap;
  const LoginPages({super.key, required this.onTap});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final username = TextEditingController();
  final password = TextEditingController();
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text, password: password.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.code);
    }
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Center(child: Text(message)));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 50,
              ),

              //logo
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.black,
              ),

              const SizedBox(
                height: 50,
              ),

              const Text(
                "Welcome back you've been missed ",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),

              const SizedBox(
                height: 25,
              ),

              //username textfield
              MyTextField(
                hintText: "UserName Enter",
                obsecureText: false,
                controllers: username,
              ),

              const SizedBox(
                height: 25,
              ),

              // password
              MyTextField(
                hintText: "Password Enter",
                obsecureText: true,
                controllers: password,
              ),
              const SizedBox(
                height: 10,
              ),
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ForgetPassword(context: context),
                            ));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // sign in
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                onTap: signUserIn,
                text: 'Sign In',
              ),

              const SizedBox(
                height: 25,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Continue with",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: Image.asset(
                      'assets/google.png',
                      height: 40,
                    ),
                    onTap: () => AuthService().signInWithgoogle(),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  SquareTile(
                      imagePath: const Column(
                        children: [
                          Text(
                            "BUY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "COFFE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayScreen(context: context),
                            ));
                      })
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
