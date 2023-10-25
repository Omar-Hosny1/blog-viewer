import 'package:blog_viewer/models/user-data.dart';
import 'package:blog_viewer/screens/auth.dart';
import 'package:blog_viewer/screens/home.dart';
import 'package:blog_viewer/services/auth-service.dart';
import 'package:blog_viewer/utils/catch-error.dart';
import 'package:blog_viewer/utils/prefs-keys.dart';
import 'package:blog_viewer/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  _saveDataInPrefs(UserData userData) async {
    final prefs = await SharedPreferences.getInstance();
    final expiresIn = DateTime.now()
        .add(Duration(seconds: int.parse(userData.expiresIn)))
        .toIso8601String();

    await prefs.setString(TOKEN, userData.idToken);
    await prefs.setString(
      EXPIRES_IN,
      expiresIn,
    );
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Auth.routeName);
  }

  signin({required String email, required String password}) {
    handleNetworkRequests(
      tryLogic: () async {
        final response = await AuthService.login(
          email: email,
          password: password,
        );
        showSnackbar(
          SnackbarState.success,
          'Logged in Successfuly',
          'Logged in Successfuly',
        );
        _saveDataInPrefs(response);
        Get.toNamed(Home.routeName);
      },
    );
  }

  signup({required String email, required String password}) {
    handleNetworkRequests(
      tryLogic: () async {
        final response = await AuthService.signup(
          email: email,
          password: password,
        );
        showSnackbar(
          SnackbarState.success,
          'Signed up Successfuly',
          'Signed up Successfuly',
        );
        _saveDataInPrefs(response);
        Get.toNamed(Home.routeName);
      },
    );
  }

  Future<String> getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final prefsExpiresIn = prefs.getString(EXPIRES_IN);
    if (prefsExpiresIn == null) {
      return Auth.routeName;
    }

    final expiresIn = DateTime.parse(prefsExpiresIn);

    if (expiresIn.isBefore(DateTime.now())) {
      return Auth.routeName;
    }
    return Home.routeName;
  }
}
