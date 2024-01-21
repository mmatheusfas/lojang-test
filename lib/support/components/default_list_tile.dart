import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/features/articles/article_details/article_details_view.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:lojang_test/support/components/share_button.dart';
import 'package:lojang_test/support/style/app_colors.dart';

class DefaultListTile extends StatelessWidget {
  final Video? video;
  final Article? article;

  const DefaultListTile({
    super.key,
    this.video,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (article != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailsView(article: article!)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              video?.name ?? article!.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(video?.imageUrl ?? article!.imageUrl),
                  ),
                ),
                child: Visibility(
                  visible: video != null,
                  child: Center(
                    child: SvgPicture.asset('assets/images/play_button.svg', height: 60),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              video?.description ?? article!.description,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            ShareButton(
              hasIcon: true,
              shareUrl: video?.videoUrl ?? article!.articleUrl,
              primaryColor: AppColors.darkGrey,
              backgroundColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
