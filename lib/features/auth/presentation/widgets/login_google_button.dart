import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:flutter_videos_app/common/presentation/cubits/auth_cubit/auth_cubit.dart';

class LoginGoogleButton extends StatefulWidget {
  const LoginGoogleButton({super.key});

  @override
  State<LoginGoogleButton> createState() => _LoginGoogleButtonState();
}

class _LoginGoogleButtonState extends State<LoginGoogleButton> {
  bool _isLoading = false;

  Future<void> _onPressed() async {
    setState(() => _isLoading = true);
    await context.read<AuthCubit>().signIn();
    setState(() => _isLoading = false);
  }

  Widget get _icon {
    if (_isLoading) {
      return const SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return const Icon(Ionicons.logo_google, size: 26);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: _icon,
      label: const Text('Login with Google'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(fontSize: 18),
      ),
      onPressed: _onPressed,
    );
  }
}
