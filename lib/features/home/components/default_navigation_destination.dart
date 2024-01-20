import 'package:flutter/material.dart';

import '../../../support/utils/app_fonts.dart';

class DefaultNavigationDestination extends StatelessWidget {
  final String title;
  const DefaultNavigationDestination({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Text(
        title,
        style: AppFonts.asapBold(16, Colors.white),
      ),
      label: '',
      selectedIcon: Text(
        title,
        style: AppFonts.asapBold(
          16,
          const Color.fromRGBO(224, 144, 144, 1),
        ),
      ),
    );
  }
}
