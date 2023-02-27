import 'package:flutter/material.dart';

const _decoration = InputDecoration(
  border: OutlineInputBorder(),
  isDense: true,
);

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: _obscure,
      decoration: _decoration.copyWith(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscure = !_obscure),
          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: widget.validator,
    );
  }
}

class InputFormField extends StatelessWidget {
  const InputFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.maxLines,
  });

  final int? maxLines;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _decoration.copyWith(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
