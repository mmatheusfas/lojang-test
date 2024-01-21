import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lojang_test/features/articles/article_details/article_details_view_model.dart';
import 'package:lojang_test/features/articles/article_details/components/author_card.dart';
import 'package:lojang_test/support/components/deafult_back_button.dart';
import 'package:lojang_test/support/components/share_button.dart';
import 'package:lojang_test/support/placeholders/error_placeholder.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../../support/style/app_fonts.dart';
import '../article.dart';

class ArticleDetailsView extends StatefulWidget {
  final Article article;

  const ArticleDetailsView({super.key, required this.article});

  @override
  State<ArticleDetailsView> createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<ArticleDetailsView> {
  final viewModel = ArticleDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initialize(id: widget.article.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.salmon,
          appBar: AppBar(
            backgroundColor: AppColors.salmon,
            leading: DefaultBackButton(
              onTapBackButton: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned.fill(
          top: 110,
          child: Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: AppColors.lightGrey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, snapshot) {
                  if (viewModel.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.salmon,
                      ),
                    );
                  }

                  if (viewModel.connectivityError.isNotEmpty) {
                    return Expanded(
                      child: ErrorPlaceHolder(
                        errorMessage: viewModel.connectivityError,
                        onTapReload: () {
                          viewModel.didTapReload(id: widget.article.id);
                        },
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.grey,
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(viewModel.detailedArticle?.imageUrl ?? ''),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          viewModel.detailedArticle?.title ?? '',
                          textAlign: TextAlign.center,
                          style: AppFonts.asapSemiBold(18, AppColors.black05),
                        ),
                        const SizedBox(height: 16),
                        Html(data: viewModel.detailedArticle?.fullText ?? ''),
                        const SizedBox(height: 16),
                        AuthorCard(detailedArticle: viewModel.detailedArticle),
                        const SizedBox(height: 20),
                        ShareButton(
                          primaryColor: AppColors.white,
                          backgroundColor: AppColors.salmon,
                          shareUrl: viewModel.detailedArticle?.articleUrl ?? '',
                          hasIcon: false,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
