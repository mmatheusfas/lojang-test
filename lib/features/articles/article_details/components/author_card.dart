import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lojang_test/features/articles/article_details/detailed_article.dart';
import 'package:lojang_test/support/constants.dart';
import 'package:lojang_test/support/style/app_colors.dart';
import 'package:lojang_test/support/style/app_fonts.dart';

class AuthorCard extends StatelessWidget {
  final DetailedArticle? detailedArticle;

  const AuthorCard({super.key, required this.detailedArticle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: detailedArticle?.authorImage != null
                ? CachedNetworkImageProvider(detailedArticle?.authorImage ?? '')
                : const CachedNetworkImageProvider(Constants.defaultAvatarImage),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailedArticle?.authorName ?? '',
                  style: AppFonts.asapSemiBold(16, AppColors.black05),
                ),
                const SizedBox(height: 12),
                Text(
                  detailedArticle?.authorDescription ?? detailedArticle!.description,
                  style: AppFonts.asapRegular(12, AppColors.black05),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
