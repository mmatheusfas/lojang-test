import 'package:flutter/material.dart';
import 'package:lojang_test/features/home/home_view_model.dart';

import '../../support/components/deafult_back_button.dart';
import '../articles/articles_view.dart';
import '../quotes/quotes_view.dart';
import '../videos/videos_view.dart';
import 'components/default_navigation_destination.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
                leading: DefaultBackButton(
                  onTapBackButton: () {},
                ),
                title: const Text(
                  'INSPIRAÇÕES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 80),
                  child: NavigationBar(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
                    onDestinationSelected: viewModel.changeCurrentIndex,
                    selectedIndex: viewModel.currentIndex,
                    indicatorColor: Colors.white,
                    destinations: const [
                      DefaultNavigationDestination(title: 'Videos'),
                      DefaultNavigationDestination(title: 'Artigos'),
                      DefaultNavigationDestination(title: 'Citações'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 190,
              child: IndexedStack(
                index: viewModel.currentIndex,
                children: [
                  VideosView(),
                  const ArticlesView(),
                  const QuotesView(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
