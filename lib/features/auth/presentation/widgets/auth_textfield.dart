import 'package:chat_app/core/formatters/phone_number_formatter.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const AuthTextField({super.key, this.controller, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PhoneNumberFormatter()
      ],
      style: const TextStyle(fontSize: 28),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          labelStyle: TextStyle(fontSize: 28),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: UiColor.grey)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: UiColor.darkest))),
    );
  }
}
