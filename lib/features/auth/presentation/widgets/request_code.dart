import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/features/auth/presentation/viewModel/view_model.dart';
import 'package:chat_app/features/widgets/auth_text_field/auth_textfield.dart';
import 'package:chat_app/features/widgets/button/auth_button.dart';
import 'package:chat_app/features/widgets/drop_down/main_drop_down.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestCode extends StatelessWidget {
  RequestCode({super.key});

  final List countryCodes = [
    {'title': '+7', 'value': 7},
    {'title': '+1', 'value': 1},
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    return Column(
      children: [
        Text(
          'Войти по номеру телефона',
          style: AppTextStyles.h5.copyWith(color: UiColor.darkest),
        ),
        50.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainDropDown(vm: vm, countryCodes: countryCodes),
            20.w,
            Expanded(
                child: AuthTextField(
              focusNode: vm.focusNode,
              controller: vm.phoneController,
            ))
          ],
        ),
        34.h,
        Row(
          children: [
            10.w,
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              value: vm.isAgree,
              onChanged: (value) {
                vm.isAgree = value ?? false;
              },
            ),
            30.w,
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: 'Согласие на ',
                      style: AppTextStyles.h8.copyWith(color: UiColor.dark),
                      children: [
                    TextSpan(
                        text: 'пользовательское соглашение',
                        style: AppTextStyles.h8.copyWith(
                            color: UiColor.darkest,
                            decoration: TextDecoration.underline)),
                    TextSpan(
                        text: ' и ',
                        style: AppTextStyles.h8.copyWith(color: UiColor.dark)),
                    TextSpan(
                        text: 'политика конфиденциальности.',
                        style: AppTextStyles.h8.copyWith(
                            color: UiColor.darkest,
                            decoration: TextDecoration.underline)),
                  ])),
            )
          ],
        ),
        137.h,
        if (!vm.disabledButton)
          SizedBox(
            width: double.infinity,
            child: AuthButton(
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return CupertinoAlertDialog(
                        title: Text(
                          'Номер указан верно?',
                          textAlign: TextAlign.left,
                          style:
                              AppTextStyles.h6.copyWith(color: UiColor.darkest),
                        ),
                        content: Column(
                          children: [
                            30.h,
                            Text(
                              '+7 (775) 880 33 88',
                              style: AppTextStyles.h4
                                  .copyWith(color: UiColor.darkest),
                            ),
                            30.h,
                            Text(
                              'Наши роботы отправят SMS  с кодом активации на указанный номер',
                              style: AppTextStyles.h7
                                  .copyWith(color: UiColor.dark),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            textStyle:
                                AppTextStyles.h7.copyWith(color: UiColor.dark),
                            child: const Text('Изменить'),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            textStyle: AppTextStyles.h7
                                .copyWith(color: UiColor.darkest),
                            child: const Text('Верно'),
                          )
                        ],
                      );
                    });
              },
              title: 'Продолжить',
              color: vm.isFilled ? UiColor.primary : UiColor.lightest,
              titleColor: vm.isFilled ? null : UiColor.light,
            ),
          ),
        if (vm.disabledButton)
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: UiColor.grey,
                    ),
                  ),
                  18.w,
                  Text(
                    'или войти с помощью',
                    style: AppTextStyles.h8.copyWith(color: UiColor.dark),
                  ),
                  18.w,
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: UiColor.grey,
                    ),
                  ),
                ],
              ),
              60.h,
              SizedBox(
                width: double.infinity,
                child: AuthButton(
                  onPressed: () {
                    print('object');
                  },
                  title: 'Войти через Apple',
                  color: UiColor.darkest,
                  image: 'assets/images/apple.png',
                ),
              ),
              20.h,
              SizedBox(
                width: double.infinity,
                child: AuthButton(
                  onPressed: () {},
                  title: 'Войти через Facebook',
                  color: const Color(0xFF1769FF),
                  image: 'assets/images/facebook.png',
                ),
              ),
              20.h,
              SizedBox(
                width: double.infinity,
                child: AuthButton(
                  onPressed: () {},
                  title: 'Войти через Google',
                  color: UiColor.lightest,
                  image: 'assets/images/google.png',
                  titleColor: UiColor.darkest,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
