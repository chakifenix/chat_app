import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  List countryCodes = [
    {'title': '+7', 'value': 7},
    {'title': '+1', 'value': 1},
  ];
  int selectedValue = 7;
  final TextEditingController phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isButtonVisible = false;
  bool isFilled = false;

  void _handleTapOutside(BuildContext context) {
    if (isButtonVisible) {
      _focusNode.unfocus(); // Закрываем клавиатуру
      setState(() {
        isButtonVisible = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isButtonVisible = _focusNode.hasFocus;
      });
    });
    phoneController.addListener(() {
      setState(() {
        isFilled = phoneController.text.length == 13;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _handleTapOutside(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                144.h,
                Text(
                  'Войти по номеру телефона',
                  style: AppTextStyles.h5.copyWith(color: UiColor.darkest),
                ),
                50.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: selectedValue,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            items: countryCodes.map((codes) {
                              return DropdownMenuItem<int>(
                                value: codes['value'],
                                child: Row(
                                  children: [
                                    Image.asset('assets/kazakhstan.png'),
                                    9.w,
                                    Text(
                                      codes['title'],
                                      style: AppTextStyles.h4
                                          .copyWith(color: UiColor.darkest),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value ?? 0;
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 90,
                          color: UiColor.darkest,
                        )
                      ],
                    ),
                    20.w,
                    Expanded(
                        child: AuthTextField(
                      focusNode: _focusNode,
                      controller: phoneController,
                    ))
                  ],
                ),
                34.h,
                Row(
                  children: [
                    10.w,
                    SizedBox.shrink(
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    30.w,
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'Согласие на ',
                              style: AppTextStyles.h8
                                  .copyWith(color: UiColor.dark),
                              children: [
                            TextSpan(
                                text: 'пользовательское соглашение',
                                style: AppTextStyles.h8.copyWith(
                                    color: UiColor.darkest,
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                                text: ' и ',
                                style: AppTextStyles.h8
                                    .copyWith(color: UiColor.dark)),
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
                if (isButtonVisible)
                  SizedBox(
                    width: double.infinity,
                    child: AuthButton(
                      onPressed: () {
                        // showCupertinoDialog(
                        //     context: context,
                        //     builder: (BuildContext ctx) {
                        //       return CupertinoAlertDialog(
                        //         title: const Text('Please Confirm'),
                        //       );
                        //     });
                      },
                      title: 'Продолжить',
                      color: isFilled ? UiColor.primary : UiColor.lightest,
                      titleColor: isFilled ? null : UiColor.light,
                    ),
                  ),
                if (!isButtonVisible)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: AuthButton(
                          onPressed: () {
                            print('object');
                          },
                          title: 'Войти через Apple',
                          color: UiColor.darkest,
                          image: 'assets/apple.png',
                        ),
                      ),
                      20.h,
                      SizedBox(
                        width: double.infinity,
                        child: AuthButton(
                          onPressed: () {},
                          title: 'Войти через Facebook',
                          color: const Color(0xFF1769FF),
                          image: 'assets/facebook.png',
                        ),
                      ),
                      20.h,
                      SizedBox(
                        width: double.infinity,
                        child: AuthButton(
                          onPressed: () {},
                          title: 'Войти через Google',
                          color: UiColor.lightest,
                          image: 'assets/google.png',
                          titleColor: UiColor.darkest,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
