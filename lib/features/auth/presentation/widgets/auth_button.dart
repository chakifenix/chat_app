import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/cupertino.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Color color;
  final String image;
  const AuthButton({
    super.key,
    required this.title,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      color: color,
      child: Row(
        children: [
          Image.asset(image),
          12.w,
          Text(
            title,
            style: AppTextStyles.h7,
          ),
        ],
      ),
    );
  }
}
