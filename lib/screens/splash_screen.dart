import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:point_of_sale/auth/login_screen.dart';
import 'package:point_of_sale/auth/signup_screen.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Get.to(const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Point Of Sale',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Jersey"),
            ),
          ),
          GFImageOverlay(
            height: 300,
            width: 270,
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.darken),
            image: const AssetImage('assets/shop (1).png'),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(top: 80.0, left: 130),
        child: Text(
          'CopyRights © 2024',
          style: TextStyle(
              color: Colors.white60, fontFamily: "Jersey", fontSize: 15),
        ),
      ),
    );
  }
}
