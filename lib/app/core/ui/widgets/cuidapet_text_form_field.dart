import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/theme_extension.dart';

class CuidapetTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CuidapetTextFormField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.controller,
      this.validator})
      : _obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey)),
            suffixIcon: obscureText
                ? IconButton(
                    splashRadius: 20,
                    color: context.primaryColor,
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextVNValue;
                    },
                    icon:
                        Icon(obscureTextVNValue ? Icons.lock : Icons.lock_open),
                  )
                : null,
          ),
        );
      },
    );
  }
}
