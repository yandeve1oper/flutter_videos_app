import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_videos_app/common/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_videos_app/core/router/pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final user = cubit.state.user;
    final email = user?.email ?? 'Unknown email';

    return Scaffold(
      appBar: AppBar(
        title: Text(HomePages.profile.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile: $email',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: cubit.signOut,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
