import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Color color;
  final String? image;
  final Color? titleColor;
  final Function() onPressed;
  const AuthButton(
      {super.key,
      required this.title,
      required this.color,
      this.image,
      this.titleColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null ? Image.asset(image!) : const SizedBox(),
          12.w,
          Text(
            title,
            style: AppTextStyles.h7.copyWith(color: titleColor ?? Colors.white),
          ),
        ],
      ),
    );
  }
}
