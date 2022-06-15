import 'package:flutter/material.dart';

import '../constants.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  String hintText;
  final Function validator;
  final Function onChangeFun;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final Widget suffixIcon;

  AuthTextFromField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.hintText,
    required this.textInputType,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onChangeFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      onChanged: (value) => onChangeFun(value),
      obscureText: obscureText,
      cursorColor: KTextFormFiled,
      style: const TextStyle(color: kBlackColor),
      keyboardType: textInputType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: KTextFormFiled,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KTextFormFiled,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
