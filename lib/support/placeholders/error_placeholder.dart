import 'package:flutter/material.dart';
import 'package:lojang_test/support/style/app_colors.dart';
import 'package:lojang_test/support/style/app_fonts.dart';

class ErrorPlaceHolder extends StatelessWidget {
  final String errorMessage;
  final void Function()? onTapReload;

  const ErrorPlaceHolder({
    super.key,
    required this.errorMessage,
    this.onTapReload,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OPS!',
              style: AppFonts.asapBold(16, AppColors.darkGrey),
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: AppFonts.asapRegular(16, AppColors.darkGrey),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: onTapReload != null,
              child: ElevatedButton(
                onPressed: onTapReload,
                child: Text(
                  'Recarregar',
                  style: AppFonts.asapBold(12, AppColors.darkGrey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
