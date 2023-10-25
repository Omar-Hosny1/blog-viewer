import 'dart:io';
import 'package:blog_viewer/utils/snackbar.dart';

handleNetworkRequests(
    {required Function tryLogic, Function? finallyLogic}) async {
  try {
    await tryLogic();
  } on HttpException catch (e) {
    showSnackbar(
      SnackbarState.danger,
      'Something Went Wrong',
      _getFirebaseErrorMessage(
        e.message,
      ),
    );
  } catch (e) {
    showSnackbar(
      SnackbarState.danger,
      'Something Went Wrong',
      'Check your network.',
    );
  } finally {
    if (finallyLogic != null) {
      finallyLogic();
    }
  }
}

_getFirebaseErrorMessage(String msg) {
  switch (msg) {
    case 'EMAIL_EXISTS':
      return 'This Email Already in use!';
    case 'EMAIL_NOT_FOUND':
      return 'Can\'t Find Your Email.';
    case 'INVALID_PASSWORD':
      return 'Invalid Password, Try Again!';
    default:
      return msg;
  }
}
