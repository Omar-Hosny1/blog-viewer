import 'package:blog_viewer/controllers/add-blog-controller.dart';
import 'package:blog_viewer/controllers/auth-controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AddBlogController>(AddBlogController());
  }
}
