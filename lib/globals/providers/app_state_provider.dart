import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider extends GetxController {
  //Obs check if onboarding is done
  var hasCompletedOnboarding = false.obs;

  // Onboarding state is done
  Future<void> completeOnboarding() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Onboarding state is done in sharedpref
    await prefs.setBool('onBoardCompleted', true);

    // Updating obs
    hasCompletedOnboarding.value = true;
  }

  // Check onboarding state at app launch
  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if onboarding is done and update obs
    bool? completed = prefs.getBool('onBoardCompleted');
    hasCompletedOnboarding.value = completed ?? false;
  }

}
