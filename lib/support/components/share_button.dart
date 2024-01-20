import 'package:flutter/material.dart';
import 'package:lojang_test/support/utils/app_fonts.dart';

class ShareButton extends StatelessWidget {
  final Color primaryColor;
  final Color backgroundColor;
  final String shareUrl;

  const ShareButton({
    super.key,
    required this.primaryColor,
    required this.backgroundColor,
    required this.shareUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(140, 32),
      ),
      onPressed: () {},
      icon: Icon(
        Icons.share,
        color: primaryColor,
        size: 16,
      ),
      label: Text(
        'Compartilhar',
        style: AppFonts.asapSemiBold(
          12,
          primaryColor,
        ),
      ),
    );
  }
}
