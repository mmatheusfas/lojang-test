import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 2,
              )
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    AppColors.white.withOpacity(0.6),
                    BlendMode.srcOver,
                  ),
                  imageController % 2 == 0
                      ? 'assets/images/mountains_background .svg'
                      : 'assets/images/green_background .svg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quote.text,
                        textAlign: TextAlign.center,
                        style: AppFonts.asapSemiBold(
                          12,
                          imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        quote.author,
                        textAlign: TextAlign.center,
                        style: AppFonts.asapBold(
                          16,
                          imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                        ),
                      ),
                      const Spacer(),
                      ShareButton(
                        hasIcon: true,
                        primaryColor: AppColors.white,
                        backgroundColor: imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                        shareUrl: quote.text,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey,
                    blurRadius: 2,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    AppColors.white.withOpacity(0.6),
                    BlendMode.srcOver,
                  ),
                  imageController % 2 == 0
                      ? 'assets/images/mountains_background .svg'
                      : 'assets/images/green_background .svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 36,
                right: 12,
                left: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    quote.text,
                    textAlign: TextAlign.center,
                    style: AppFonts.asapSemiBold(
                      12,
                      imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    quote.author,
                    textAlign: TextAlign.center,
                    style: AppFonts.asapBold(
                      16,
                      imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 110,
            right: 110,
            bottom: 5,
            child: ShareButton(
              hasIcon: true,
              primaryColor: AppColors.white,
              backgroundColor: imageController % 2 == 0 ? AppColors.blue : AppColors.brown,
              shareUrl: quote.text,
            ),
          ),
        ],
      ),
    ); */
  }
}
