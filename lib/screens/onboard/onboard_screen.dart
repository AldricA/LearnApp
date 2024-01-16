import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:LearnApp/globals/providers/app_state_provider.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accès à l'instance de AppStateProvider avec GetX
    final AppStateProvider appStateProvider = Get.find<AppStateProvider>();

    return Scaffold(
      body: Center(
          child: Column(
            children: [
              const Text("This is Onboard Screen"),
              ElevatedButton(
                  onPressed: () {
                    // Appel de completeOnboarding sur l'instance de AppStateProvider
                    appStateProvider.completeOnboarding();
                    // Naviguer vers la page d'accueil
                    GoRouter.of(context).go("/");
                  },
                  child: const Text("Done/Skip")
              )
            ],
          )
      ),
    );
  }
}
