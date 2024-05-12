import "package:flutter/material.dart";

class MyTextField extends StatefulWidget {

  // final controller; 
  // final String hintText;
  // final bool obscureText;

  const MyTextField({

    super.key,
    // required this.controller,
    // required this.hintText, 
    // required this.obscureText
    });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        // controller: null,
        // obscureText: true,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            // hintText: 
            ),
      ),
    );
  }
}
