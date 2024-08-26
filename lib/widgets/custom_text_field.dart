import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.obsecureText = false,
      this.inputType});
  String? hintText;
  bool? obsecureText;
  TextInputType? inputType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obsecureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                // color: Colors.white,
                )),
        hintText: hintText,
        hintStyle: const TextStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(

                // color: Colors.white,
                )),
      ),
    );
  }
}
