import 'package:flutter/material.dart';

class WidgetFormFieldTextDefault extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final TextInputType textInputType;
  final bool obscureText;
  final bool enabled;
  final String helperText;
  final TextEditingController controller;

  WidgetFormFieldTextDefault({
    @required this.hintText,
    @required this.icon,
    this.validator,
    this.onSaved,
    this.textInputType = TextInputType.multiline,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.helperText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      obscureText: obscureText,
      maxLines: 1,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        icon: Icon(
          icon,
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
