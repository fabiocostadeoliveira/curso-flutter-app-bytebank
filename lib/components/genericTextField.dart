import 'package:flutter/material.dart';

class EditorTextField extends StatelessWidget {
  final TextEditingController controlador;
  final String labelText;
  final String hintText;
  final IconData icon;

  const EditorTextField({
    this.controlador,
    this.labelText,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
