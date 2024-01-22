import 'package:flutter/material.dart';
import 'package:lojang_test/support/components/svg_viewer.dart';
import 'package:lojang_test/support/style/app_colors.dart';

class DefaultBackButton extends StatelessWidget {
  final VoidCallback? onTapBackButton;

  const DefaultBackButton({super.key, this.onTapBackButton});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onTapBackButton,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.transparent,
      ),
      icon: const SvgViewer.asset(assetName: 'assets/images/ic_arrow_back.svg'),
    );
  }
}
