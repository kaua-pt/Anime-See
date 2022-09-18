import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String text;
  final TextInputType type;
  final bool isObscured;
  final String hint;
  final TextEditingController textController;

  TextInput(
      {required this.text,
      required this.type,
      this.isObscured = false,
      required this.hint,
      required this.textController});

  @override
  State<StatefulWidget> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.text,
          labelStyle: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontFamily: "Nasalization-rg")),
      controller: widget.textController,
    );
  }
}
