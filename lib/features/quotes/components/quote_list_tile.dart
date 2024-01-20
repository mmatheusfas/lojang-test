import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojang_test/features/quotes/quote.dart';

import '../../../support/components/share_button.dart';
import '../../../support/utils/app_fonts.dart';

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
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 2,
                )
              ],
            ),
            height: 340,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.6),
                  BlendMode.srcOver,
                ),
                imageController % 2 == 0
                    ? 'assets/images/mountains_background .svg'
                    : 'assets/images/green_background .svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 36, right: 12, left: 12, bottom: 12),
              child: Column(
                children: [
                  Text(
                    quote.text,
                    textAlign: TextAlign.center,
                    style: AppFonts.asapSemiBold(
                      12,
                      imageController % 2 == 0 ? const Color.fromRGBO(68, 109, 175, 1) : Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    quote.author,
                    textAlign: TextAlign.center,
                    style: AppFonts.asapBold(
                      16,
                      imageController % 2 == 0 ? const Color.fromRGBO(68, 109, 175, 1) : Colors.brown,
                    ),
                  ),
                  const Spacer(),
                  ShareButton(
                    primaryColor: Colors.white,
                    backgroundColor: imageController % 2 == 0 ? const Color.fromRGBO(68, 109, 175, 1) : Colors.brown,
                    shareUrl: quote.text,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    /* return Container(
      height: 340,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/mountains_background.png'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 36, right: 12, left: 12, bottom: 12),
        child: Column(
          children: [
            Text(
              quote.text,
              textAlign: TextAlign.center,
              style: AppFonts.asapSemiBold(
                12,
                const Color.fromRGBO(68, 109, 175, 1),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              quote.author,
              textAlign: TextAlign.center,
              style: AppFonts.asapBold(
                16,
                const Color.fromRGBO(68, 109, 175, 1),
              ),
            ),
            const Spacer(),
            ShareButton(
              primaryColor: Colors.white,
              backgroundColor: const Color.fromRGBO(64, 103, 171, 1),
              shareUrl: quote.text,
            ),
          ],
        ),
      ),
    ); */
  }
}
