import 'dart:math';

import 'package:blog_viewer/models/blog.dart';
import 'package:blog_viewer/services/bolg-service.dart';
import 'package:blog_viewer/utils/catch-error.dart';
import 'package:blog_viewer/utils/snackbar.dart';
import 'package:get/get.dart';

class AddBlogController extends GetxController {
  static AddBlogController get to => Get.find<AddBlogController>();

  addBlogHandler({required String title, required String body}) {
    handleNetworkRequests(
      tryLogic: () async {
        final random = Random();
        await BlogService.addBlog(
          blog: Blog(
            userId: random.nextInt(1),
            id: random.nextInt(1),
            title: title,
            body: body,
          ),
        );
        Get.back();
        showSnackbar(
          SnackbarState.success,
          'Added Successfuly',
          'Blog Added Successfuly',
        );
      },
    );
  }
}
