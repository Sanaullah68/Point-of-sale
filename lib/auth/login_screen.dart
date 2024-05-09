import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:point_of_sale/screens/dashboard_screen.dart';
import 'package:point_of_sale/auth/signup_screen.dart';
import 'package:point_of_sale/widgets/custom_textfield.dart';
import 'package:point_of_sale/controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final controller = Get.put(HomeController());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.indigo, Colors.redAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const GFAvatar(
                      backgroundImage: AssetImage('assets/shop.png'),
                      shape: GFAvatarShape.circle,
                      size: 150,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      //padding: EdgeInsets.all(12),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            obscuretext: false,
                            controller: emailController,
                            hinttext: 'Email',
                            //labletext: "Email",
                            icon: const Icon(Icons.email_outlined),
                            validator: (email) =>
                                controller.validateEmail(email),
                          ),
                          CustomTextField(
                            controller: passwordController,
                            obscuretext: false,
                            //labletext: "Password",
                            hinttext: 'Password',
                            sufixicon: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.remove_red_eye_outlined)),
                            icon: const Icon(Icons.lock_open),
                            validator: (password) =>
                                controller.validatePassword(password),
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
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                position: GFPosition.start,
                                onPressed: () async {
                                  controller.CheckEmail();
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                  setState(() {
                                    emailController.clear();
                                    passwordController.clear();
                                  });
                                  //if (!context.mounted) return;
                                  Get.to(() => DashboardScreen());
                                },
                                shape: GFButtonShape.pills,
                                elevation: 1,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: GFColors.TRANSPARENT,
                                size: 60,
                                hoverColor: GFColors.FOCUS,
                                focusColor: GFColors.SECONDARY,
                                borderSide: BorderSide.none,
                                icon: const Icon(
                                  Icons.login_outlined,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                fullWidthButton: false,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Jersey',
                                      color: Colors.cyanAccent),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontSize: 19, fontFamily: 'Jersey'),
                              ),
                              GestureDetector(
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Get.to(SignUpScreen());
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
