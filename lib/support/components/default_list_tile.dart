import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/features/articles/article_details/article_details_view.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:lojang_test/support/components/share_button.dart';
import 'package:lojang_test/support/components/svg_viewer.dart';
import 'package:lojang_test/support/extensions/string_extension.dart';
import 'package:lojang_test/support/style/app_colors.dart';
import 'package:lojang_test/support/style/app_fonts.dart';

class DefaultListTile extends StatelessWidget {
  final Video? video;
  final Article? article;
  final int? index;

  const DefaultListTile({
    super.key,
    this.video,
    this.article,
    this.index,
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          children: [
            Text(
              video != null ? 'EP. ${index.toString().padLeftZeroString}: ${video?.name}' : article!.title,
              textAlign: TextAlign.center,
              style: AppFonts.asapBold(18, AppColors.grey),
            ),
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _bodyWidget(),
            ),
            const SizedBox(height: 12),
            Text(
              video?.description ?? article!.description,
              style: AppFonts.asapSemiBold(14, AppColors.darkGrey),
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

  Widget _bodyWidget() {
    return Container(
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
        child: const Center(
          child: SvgViewer.asset(assetName: 'assets/images/play_button.svg', height: 60),
        ),
      ),
    );
  }
}
