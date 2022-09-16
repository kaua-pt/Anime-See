import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String text;
  final TextInputType type;
  final bool isObscured;
  final String hint;

  TextInput(
      {required this.text,
      required this.type,
      this.isObscured = false,
      required this.hint});

  @override
  State<StatefulWidget> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  final TextEditingController _textController = TextEditingController();

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
      controller: _textController,
    );
  }
}
