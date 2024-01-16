import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:LearnApp/globals/providers/app_state_provider.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentImgIndex = 0; // Current page tracking

  final onBoardScreenImages = [
    "assets/OnBoarding#1",
    "assets/OnBoarding#2",
  ];

  void nextImage() {
    if (_currentImgIndex < onBoardScreenImages.length - 1) {
      setState(() => _currentImgIndex += 1);
    }
  }

  void prevImage() {
    if (_currentImgIndex > 0) {
      setState(() => _currentImgIndex -= 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppStateProvider appStateProvider = Get.find<AppStateProvider>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 255, 209, 166),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: ((child, animation) =>
                    ScaleTransition(scale: animation, child: child)),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  onBoardScreenImages[_currentImgIndex],
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  key:
                  ValueKey<int>(_currentImgIndex),
                ),
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: prevImage,
                      icon: _currentImgIndex == 0
                          ? const Icon(null)
                          : const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: _currentImgIndex == onBoardScreenImages.length - 1
                          ? () {
                        appStateProvider.completeOnboarding();
                        GoRouter.of(context).go("/");
                      }
                          : nextImage,
                      icon: _currentImgIndex == onBoardScreenImages.length - 1
                          ? const Icon(Icons.done)
                          : const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}