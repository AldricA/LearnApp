// represents different routes
enum APP_PAGE {
  onboard,
  auth,
  home,
}


extension AppPageExtension on APP_PAGE {
  // routes path
  String get routePath {
    switch (this) {
      case APP_PAGE.home:
        return "/";

      case APP_PAGE.onboard:
        return "/onboard";

      case APP_PAGE.auth:
        return "/auth";

      default:
        return "/";
    }
  }

// for named routes
  String get routeName {
    switch (this) {
      case APP_PAGE.home:
        return "HOME";

      case APP_PAGE.onboard:
        return "ONBOARD";

      case APP_PAGE.auth:
        return "AUTH";

      default:
        return "HOME";
    }
  }

// page title
  String get routePageTitle {
    switch (this) {
      case APP_PAGE.home:
        return "PersonnalApp";

      default:
        return "PersonnalApp";
    }
  }
}