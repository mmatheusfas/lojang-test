import 'package:flutter/material.dart';
import 'package:lojang_test/features/videos/videos_view.dart';

import '../../support/components/deafult_back_button.dart';
import '../articles/articles_view.dart';
import '../quotes/quotes_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
            leading: const DefaultBackButton(),
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
              preferredSize: const Size.fromHeight(100),
              child: NavigationBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                selectedIndex: currentPageIndex,
                destinations: const [
                  NavigationDestination(
                    icon: Text(
                      'Videos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Text(
                      'Artigos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Text(
                      'Citações',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 190,
          child: IndexedStack(
            index: currentPageIndex,
            children: [
              VideosView(),
              const ArticlesView(),
              const QuotesView(),
            ],
          ),
        ),
      ],
    );
  }
}
