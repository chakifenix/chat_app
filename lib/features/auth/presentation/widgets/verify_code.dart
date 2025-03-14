import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/features/auth/presentation/viewModel/view_model.dart';
import 'package:chat_app/features/widgets/button/auth_button.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    return Column(
      children: [
        Text(
          'Введите код активации',
          style: AppTextStyles.h5.copyWith(color: UiColor.darkest),
        ),
        50.h,
        Pinput(
          controller: vm.codeController,
          focusNode: vm.focusNode,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: UiColor.grey)),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: UiColor.darkest)),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: UiColor.darkest)),
            ),
          ),
        ),
        20.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Введите 4-х значный код',
              style: AppTextStyles.h9.copyWith(color: UiColor.grey),
            ),
          ],
        ),
        61.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/rotate.svg'),
            2.w,
            Text(
              'Повторно отправить код: 44 сек',
              style: AppTextStyles.h8.copyWith(color: UiColor.dark),
            )
          ],
        ),
        30.h,
        if (!vm.disabledButton || vm.codeController.text.length == 4)
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
              color: UiColor.primary,
            ),
          ),
      ],
    );
  }
}
