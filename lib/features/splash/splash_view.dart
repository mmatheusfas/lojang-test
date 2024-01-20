import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojang_test/features/home/home_view.dart';
import 'package:lojang_test/features/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.changeAnimation();
    });
  }

  double animatedWidth(double deviceWidth) {
    if (viewModel.isAnimated) return 12;

    return deviceWidth - 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 144, 144, 1),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                curve: Curves.easeInBack,
                onEnd: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                },
                width: animatedWidth(MediaQuery.of(context).size.width),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset(
                      'assets/images/lojong_logo.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
