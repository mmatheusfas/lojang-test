import 'package:flutter/material.dart';
import 'package:lojang_test/support/style/app_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final Color primaryColor;
  final Color backgroundColor;
  final String shareUrl;
  final bool hasIcon;

  const ShareButton({
    super.key,
    required this.primaryColor,
    required this.backgroundColor,
    required this.shareUrl,
    required this.hasIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(140, 32),
      ),
      onPressed: () {
        Share.shareUri(Uri.parse(shareUrl));
      },
      icon: hasIcon
          ? Icon(
              Icons.share,
              color: primaryColor,
              size: 16,
            )
          : Container(),
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
