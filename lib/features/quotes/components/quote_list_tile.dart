import 'package:flutter/material.dart';
import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/support/components/share_button.dart';

class QuoteListTile extends StatelessWidget {
  final Quote quote;
  const QuoteListTile({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: const TextStyle(
                color: Color.fromRGBO(68, 109, 175, 1),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              quote.author,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(68, 109, 175, 1),
                fontSize: 16,
                fontWeight: FontWeight.w700,
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
    );
  }
}
