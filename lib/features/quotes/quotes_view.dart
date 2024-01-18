import 'package:flutter/material.dart';
import 'package:lojang_test/features/quotes/components/quote_list_tile.dart';
import 'package:lojang_test/features/quotes/quotes_view_model.dart';

import '../../support/components/default_loading.dart';

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
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: Expanded(
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  ListView.separated(
                    controller: viewModel.getScrollController,
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: viewModel.quotesList.length,
                    itemBuilder: (_, index) {
                      final quote = viewModel.quotesList[index];

                      return QuoteListTile(quote: quote);
                    },
                  ),
                  Visibility(
                    visible: viewModel.isLoading,
                    child: const DefaultLoading(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
