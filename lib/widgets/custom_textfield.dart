import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hinttext;
  final List<TextInputFormatter>? inputformatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onchange;
  final Icon? icon;
  final bool? obscuretext;
  final TextInputType? keyboardtype;
  final IconButton? sufixicon;
  final TextEditingController? controller;
  final String? labletext;

  const CustomTextField({
    super.key,
    this.hinttext,
    this.inputformatters,
    this.validator,
    this.onchange,
    this.icon,
    this.obscuretext,
    this.keyboardtype,
    this.sufixicon,
    this.controller,
    this.labletext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardtype,
        inputFormatters: inputformatters,
        validator: validator,
        onChanged: onchange,
        obscureText: false,
        decoration: InputDecoration(
            labelText: labletext,
            labelStyle: const TextStyle(
              color: Colors.indigo,
              fontSize: 18,
            ),
            suffixIcon: sufixicon,
            suffixIconColor: Colors.indigo,
            //filled: true,
            // border: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(20),
            //   ),
            // ),
            hintText: hinttext,
            prefixIcon: icon,
            prefixIconColor: Colors.indigo),
      ),
    );
  }
}
