import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lojang_test/features/articles/article_details.dart/article_details_view_model.dart';
import 'package:lojang_test/features/articles/article_details.dart/components/author_card.dart';
import 'package:lojang_test/support/components/deafult_back_button.dart';

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
          backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
            leading: DefaultBackButton(
              onTapBackButton: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned.fill(
          top: 110,
          child: Material(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: Colors.grey[50],
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListenableBuilder(
                  listenable: viewModel,
                  builder: (context, snapshot) {
                    if (viewModel.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 3, blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(viewModel.detailedArticle?.imageUrl ?? ''),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            viewModel.detailedArticle?.title ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Html(data: viewModel.detailedArticle?.fullText ?? ''),
                          const SizedBox(height: 16),
                          const AuthorCard(),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }
}
