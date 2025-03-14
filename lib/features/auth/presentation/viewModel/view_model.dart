import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _disabledButton = true;
  bool _isAgree = false;
  int _selectedValue = 7;
  bool _isFilled = false;
  final FocusNode _focusNode = FocusNode();

  AuthViewModel() {
    _focusNode.addListener(_onFocusChange);
    _phoneController.addListener(_onPhoneTextChange);
  }

  TextEditingController get phoneController => _phoneController;
  TextEditingController get codeController => _codeController;
  bool get disabledButton => _disabledButton;
  bool get isAgree => _isAgree;
  int get selectedValue => _selectedValue;
  bool get isFilled => _isFilled;
  FocusNode get focusNode => _focusNode;

  set disabledButton(bool value) {
    _disabledButton = value;
    notifyListeners();
  }

  set isAgree(bool value) {
    _isAgree = value;
    notifyListeners();
  }

  set selectedValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }

  void _onFocusChange() {
    _disabledButton = !_focusNode.hasFocus;
    notifyListeners();
  }

  void _onPhoneTextChange() {
    _isFilled = _phoneController.text.length == 13;
    notifyListeners();
  }
}
