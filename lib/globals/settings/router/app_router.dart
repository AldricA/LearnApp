import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:LearnApp/screens/home/home.dart';
import 'utils/router_utils.dart';
import 'package:LearnApp/screens/onboard/onboard_screen.dart';
import 'package:LearnApp/globals/providers/app_state_provider.dart';

class AppRouter {
  late final GoRouter _router;

  AppRouter() {
    // Getting AppStateProvider and SharedPreferences
    final AppStateProvider appStateProvider = Get.find<AppStateProvider>();
    final SharedPreferences prefs = Get.find<SharedPreferences>();

    _router = GoRouter(
      refreshListenable: appStateProvider,
      initialLocation: "/",
      routes: [
        GoRoute(
          path: APP_PAGE.home.routePath,
          name: APP_PAGE.home.routeName,
          builder: (context, state) => Home(),
        ),
        GoRoute(
          path: APP_PAGE.onboard.routePath,
          name: APP_PAGE.onboard.routeName,
          builder: (context, state) => const OnBoardScreen(),
        ),
      ],
      redirect: (context, state) async {
        // onboard named route
        final String onboardPath = state.namedLocation(APP_PAGE.onboard.routeName);

        // Check if path is onboarding path
        bool isOnboarding = state.uri.toString() == onboardPath;

        // Check if onboardcount is in prefs
        bool toOnboard = !prefs.containsKey('onBoardCount');

        // Redirection conditionnelle
        if (toOnboard && !isOnboarding) {
          return onboardPath;
        }

        // Si l'écran d'introduction n'est pas nécessaire, continuez normalement
        return null;
      },
    );
  }
}