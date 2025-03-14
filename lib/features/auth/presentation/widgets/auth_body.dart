import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/features/auth/presentation/viewModel/view_model.dart';
import 'package:chat_app/features/auth/presentation/widgets/request_code.dart';
import 'package:chat_app/features/auth/presentation/widgets/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (!vm.disabledButton) {
            vm.focusNode.unfocus();
            vm.disabledButton = true;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                144.h,
                // RequestCode(),
                VerifyCode()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
