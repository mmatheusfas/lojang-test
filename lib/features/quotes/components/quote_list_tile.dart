import 'package:flutter/material.dart';
import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../../support/components/share_button.dart';
import '../../../support/style/app_fonts.dart';

class QuoteListTile extends StatelessWidget {
  final Quote quote;
  final int imageController;

  const QuoteListTile({
    super.key,
    required this.quote,
    required this.imageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: LayoutBuilder(builder: (context, constraints) {
        double textScaleFactor = constraints.maxWidth > 600 ? 2 : 1;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.black05,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                AppColors.white.withOpacity(0.6),
                BlendMode.srcOver,
              ),
              fit: BoxFit.cover,
              image: AssetImage(
                imageController % 2 == 0
                    ? 'assets/images/mountains_background.png'
                    : 'assets/images/green_background.png',
              ),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                quote.text,
                textAlign: TextAlign.center,
                style: AppFonts.asapRegular(
                  12 * textScaleFactor,
                  imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                quote.author,
                textAlign: TextAlign.center,
                style: AppFonts.asapSemiBold(
                  12 * textScaleFactor,
                  imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                ),
              ),
              ShareButton(
                hasIcon: true,
                primaryColor: AppColors.white,
                backgroundColor: imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                shareUrl: quote.text,
              ),
            ],
          ),
        );
      }),
    );
  }
}
