import 'package:flutter/material.dart';

class WidgetFormFieldPasswordDefault extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final TextInputType textInputType;
  final bool enabled;
  final String helperText;

  WidgetFormFieldPasswordDefault({
    @required this.hintText,
    @required this.icon,
    @required this.validator,
    this.onSaved,
    this.textInputType = TextInputType.multiline,
    this.enabled = true,
    this.onChanged,
    this.helperText,
  });

  @override
  _WidgetFormFieldPasswordDefaultState createState() =>
      _WidgetFormFieldPasswordDefaultState();
}

class _WidgetFormFieldPasswordDefaultState
    extends State<WidgetFormFieldPasswordDefault> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextFormField(
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          obscureText: _obscureText,
          maxLines: 1,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            helperText: widget.helperText,
            icon: Icon(
              widget.icon,
            ),
          ),
          validator: widget.validator,
          onSaved: widget.onSaved,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: _toggleObscureText,
            child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}
