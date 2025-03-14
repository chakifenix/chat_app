import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/features/auth/presentation/viewModel/view_model.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/material.dart';

class MainDropDown extends StatelessWidget {
  const MainDropDown({
    super.key,
    required this.vm,
    required this.countryCodes,
  });

  final AuthViewModel vm;
  final List countryCodes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: vm.selectedValue,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            items: countryCodes.map((codes) {
              return DropdownMenuItem<int>(
                value: codes['value'],
                child: Row(
                  children: [
                    Image.asset('assets/images/kazakhstan.png'),
                    9.w,
                    Text(
                      codes['title'],
                      style: AppTextStyles.h4.copyWith(color: UiColor.darkest),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              vm.selectedValue = value ?? 0;
            },
          ),
        ),
        Container(
          height: 1,
          width: 90,
          color: UiColor.darkest,
        )
      ],
    );
  }
}
