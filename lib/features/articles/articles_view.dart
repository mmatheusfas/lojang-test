import 'package:flutter/material.dart';
import 'package:lojang_test/support/components/default_loading.dart';
import 'package:lojang_test/support/components/infinity_scroll_loading.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../support/components/default_list_tile.dart';
import '../../support/placeholders/error_placeholder.dart';
import 'article_view_model.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  final viewModel = ArticlesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getArticles();
    viewModel.getScrollController.addListener(viewModel.updateVideosList);
  }

  @override
  void dispose() {
    viewModel.getScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, snapshot) {
            if (viewModel.isLoading && viewModel.articlesList.isEmpty) {
              return const DefaultLoading();
            }

            if (viewModel.errorMessage.isNotEmpty) {
              return ErrorPlaceHolder(
                errorMessage: viewModel.errorMessage,
                onTapReload: viewModel.updateVideosList,
              );
            }

            return Stack(
              children: [
                ListView.separated(
                  controller: viewModel.getScrollController,
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: viewModel.articlesList.length,
                  itemBuilder: (_, index) {
                    final article = viewModel.articlesList[index];

                    return DefaultListTile(
                      article: article,
                    );
                  },
                ),
                Visibility(
                  visible: viewModel.isLoading,
                  child: const InfinityScrollLoading(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
