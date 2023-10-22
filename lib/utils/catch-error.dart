import 'dart:io';
import 'package:blog_viewer/utils/error-msgs.dart';
import 'package:blog_viewer/utils/snackbar.dart';

handleNetworkRequests(
    {required Function tryLogic, Function? finallyLogic}) async {
  try {
    await tryLogic();
  } on HttpException catch (e) {
    showSnackbar(
      SnackbarState.danger,
      networkErrorMessageTitle,
      e.message,
    );
  } catch (e) {
    showSnackbar(
      SnackbarState.danger,
      networkErrorMessageTitle,
      networkErrorMessageSubTitle,
    );
  } finally {
    if (finallyLogic != null) {
      finallyLogic();
    }
  }
}
