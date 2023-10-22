import 'package:blog_viewer/services/auth-service.dart';
import 'package:blog_viewer/utils/catch-error.dart';
import 'package:blog_viewer/utils/snackbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

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
        print(response);
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
        print(response);
      },
    );
  }
}
