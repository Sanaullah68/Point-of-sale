import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.indigo, Colors.redAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GFAppBar(
          elevation: 0,
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: name,
                    labletext: "Name",
                  ),
                  CustomTextField(
                    controller: emailController,
                    labletext: "Email",
                  ),
                  CustomTextField(
                    controller: phoneNumber,
                    labletext: "Phone",
                  ),
                  CustomTextField(
                    controller: passwordController,
                    labletext: "Create Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  CustomTextField(
                    controller: confirmPassword,
                    labletext: "Confirm Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.indigo],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      child: GFButton(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        position: GFPosition.start,
                        onPressed: () async {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                            await FirebaseFirestore.instance
                                .collection("customers")
                                .add({
                              'name': name.text,
                              'phone': phoneNumber.text
                            });
                            setState(() {
                              isLoading = true;
                              emailController.clear();
                              passwordController.clear();
                              name.clear();
                              phoneNumber.clear();
                              confirmPassword.clear();
                            });
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        shape: GFButtonShape.pills,
                        color: GFColors.TRANSPARENT,
                        size: 60,
                        hoverColor: GFColors.FOCUS,
                        focusColor: GFColors.SECONDARY,
                        fullWidthButton: false,
                        child: const Text(
                          'SinUp',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Jersey',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
