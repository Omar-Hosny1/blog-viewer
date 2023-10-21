import 'package:blog_viewer/models/blog.dart';
import 'package:blog_viewer/services/bolg-service.dart';
import 'package:blog_viewer/utils/catch-error.dart';
import 'package:blog_viewer/utils/snackbar.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  static BlogController get to => Get.find();

  List<Blog> get blogs => [..._blogs];
  List<Blog> _blogs = [];
  Blog? blog;
  var isLoading = true;

  _endNetworkRequest() {
    isLoading = false;
    update();
  }

  fetchData() {
    handleNetworkRequests(tryLogic: () async {
      final data = await BlogService.fetchBlogs();
      _blogs = data;
      showSnackbar(
        SnackbarState.success,
        'Data Fetched Successfuly',
        'Data is up to date now.',
      );
    }, finallyLogic: () {
      _endNetworkRequest();
    });
  }

  getBlogById(int id) async {
    handleNetworkRequests(tryLogic: () async {
      isLoading = true;
      blog = null;
      final fetchedBlog = await BlogService.getBlog(id.toString());
      blog = fetchedBlog;
    }, finallyLogic: () {
      _endNetworkRequest();
    });
  }

  @override
  void onInit() async {
    // fetchData();
    super.onInit();
  }
}
