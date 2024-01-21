import 'package:flutter/material.dart';
import 'package:lojang_test/support/style/app_colors.dart';

class InfinityScrollLoading extends StatelessWidget {
  const InfinityScrollLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 0,
      left: 0,
      bottom: 24,
      child: SizedBox(
        height: 48,
        width: 48,
        child: CircleAvatar(
          backgroundColor: AppColors.salmon,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
