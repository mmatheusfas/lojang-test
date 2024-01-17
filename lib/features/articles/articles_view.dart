import 'package:flutter/material.dart';
import 'package:lojang_test/features/articles/article.dart';

import '../../support/components/default_list_tile.dart';
import 'article_view_model.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ArticlesViewModel();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: FutureBuilder<List<Article>>(
        future: viewModel.getArticles(page: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              child: Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final article = snapshot.data![index];

                    return DefaultListTile(
                      article: article,
                    );
                  },
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
