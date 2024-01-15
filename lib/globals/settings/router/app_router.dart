import 'package:go_router/go_router.dart';
import 'package:LearnApp/screens/home/home.dart';
import 'utils/router_utils.dart';

class AppRouter  {
  get router => _router;

  final _router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: APP_PAGE.home.routePath,
          name: APP_PAGE.home.routeName,
          builder: (context, state) => const Home(),
        ),
      ],
      redirect: (context, state) {});

}