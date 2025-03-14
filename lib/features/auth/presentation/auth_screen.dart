import 'package:chat_app/features/auth/presentation/viewModel/view_model.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: AuthBody(),
    );
  }
}
