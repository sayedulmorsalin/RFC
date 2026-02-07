import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool isPasswordField;
  final int? maxLines;
  final int? minLines;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.prefixIcon,
    this.isPasswordField = false,
    this.maxLines = 1,
    this.minLines,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color textColor = scheme.onSurface;
    final Color muted = scheme.onSurface.withOpacity(0.6);

    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLines: _obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,

      style: TextStyle(color: textColor),

      cursorColor: scheme.primary,

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,

        labelStyle: TextStyle(
          color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(1),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(1),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(1),
        ),

        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: muted,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),

      validator: widget.validator,
    );
  }
}
