import 'package:app/exceptions/validate_exception.dart';
import 'package:flutter/material.dart';

class EditTextInput extends StatelessWidget {
  final String? initialValue;
  final void Function(String value)? validator;
  final String? hint;
  final bool enabled;
  final void Function(String value)? onChanged;

  const EditTextInput({
    super.key,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.hint,
    this.onChanged,
  });

  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autovalidateMode: AutovalidateMode.always,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      validator: (name) {
        try {
          validator?.call(name ?? '');
          return null;
        } on ValidateException catch (ex) {
          return ex.message;
        }
      },
    );
  }
}
