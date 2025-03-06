import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text
        .replaceAll(RegExp(r'\D'), ''); // Удаляем все нецифровые символы

    String formatted = '';
    if (digits.isNotEmpty) {
      formatted += digits.substring(0, digits.length.clamp(0, 3)); // XXX
    }
    if (digits.length > 3) {
      formatted +=
          ' ${digits.substring(3, digits.length.clamp(3, 6))}'; // XXX XXX
    }
    if (digits.length > 6) {
      formatted +=
          ' ${digits.substring(6, digits.length.clamp(6, 8))}'; // XXX XXX XX
    }
    if (digits.length > 8) {
      formatted +=
          ' ${digits.substring(8, digits.length.clamp(8, 10))}'; // XXX XXX XX XX
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
