import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const BottomNavBarWidget(
      {super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding:
          const EdgeInsets.only(top: 15.5, left: 33, right: 33, bottom: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: UiColor.lightest))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem('assets/icons/lenta.svg', 'Лента', pageIndex == 0,
              onTap: () => onTap(0)),
          navItem('assets/icons/chat.svg', 'Чат', pageIndex == 1,
              onTap: () => onTap(1)),
          navItem('assets/icons/like.svg', 'Лайки', pageIndex == 2,
              onTap: () => onTap(2)),
          navItem('assets/icons/user.svg', 'Я', pageIndex == 3,
              onTap: () => onTap(3)),
        ],
      ),
    );
  }

  Widget navItem(String image, String text, bool selected,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            color: selected ? UiColor.primary : UiColor.grey,
            image,
            height: 25,
          ),
          6.h,
          Text(
            text,
            style: AppTextStyles.h9
                .copyWith(color: selected ? UiColor.primary : UiColor.grey),
          ),
        ],
      ),
    );
  }
}
