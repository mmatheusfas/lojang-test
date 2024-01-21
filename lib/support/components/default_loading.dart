import 'package:flutter/material.dart';
import 'package:lojang_test/support/style/app_colors.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.salmon,
      ),
    );
  }
}
