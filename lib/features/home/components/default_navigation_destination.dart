import 'package:flutter/material.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../../support/style/app_fonts.dart';

class DefaultNavigationDestination extends StatelessWidget {
  final String title;
  const DefaultNavigationDestination({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Text(
        title,
        style: AppFonts.asapBold(16, AppColors.white),
      ),
      label: '',
      selectedIcon: Text(
        title,
        style: AppFonts.asapBold(
          16,
          AppColors.salmon,
        ),
      ),
    );
  }
}
