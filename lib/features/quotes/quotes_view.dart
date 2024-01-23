import 'package:flutter/material.dart';
import 'package:lojang_test/features/quotes/components/quote_list_tile.dart';
import 'package:lojang_test/features/quotes/quotes_view_model.dart';
import 'package:lojang_test/support/components/default_loading.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../support/components/infinity_scroll_loading.dart';
import '../../support/placeholders/error_placeholder.dart';

class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  final viewModel = QuotesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getQuotes();
    viewModel.getScrollController.addListener(viewModel.updateQuotesList);
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, snapshot) {
            if (viewModel.isLoading && viewModel.quotesList.isEmpty) {
              return const DefaultLoading();
            }

            if (viewModel.erroMessage.isNotEmpty) {
              return ErrorPlaceHolder(
                errorMessage: viewModel.erroMessage,
              );
            }

            return Stack(
              children: [
                ListView.builder(
                  controller: viewModel.getScrollController,
                  itemCount: viewModel.quotesList.length,
                  itemBuilder: (_, index) {
                    var imageController = index;
                    final quote = viewModel.quotesList[index];

                    return QuoteListTile(quote: quote, imageController: imageController);
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
