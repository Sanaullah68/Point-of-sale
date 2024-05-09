import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late PageController pagecontoller = PageController();

  validateEmail(String? email) {
    if (GetUtils.isEmail(email ?? '')) {
      return;
    }
    return " email is not valid";
  }

  validatePassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return "password is not valid";
    }
    return null;
  }

  Future CheckEmail() async {
    final isValidate = formKey.currentState!.validate();
  }
}
