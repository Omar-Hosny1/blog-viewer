import 'package:blog_viewer/components/blog-view.dart';
import 'package:blog_viewer/controllers/auth-controller.dart';
import 'package:blog_viewer/models/blog.dart';
import 'package:blog_viewer/screens/add-blog.dart';
import 'package:blog_viewer/services/bolg-service.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/handle-network-state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: PrimaryColor,
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => AuthController.to.logout(),
              ),
              ListTile(
                title: const Text(
                  'Add Blog',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => Get.offAndToNamed(
                  AddBlog.routeName,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('All Blogs'),
          backgroundColor: PrimaryColor,
          actions: [
            InkWell(
              onTap: AuthController.to.logout,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              FutureBuilder(
                future: BlogService.fetchBlogs(),
                builder: (context, snapshot) {
                  return handleNetworkState(
                    snapshot: snapshot,
                    buildChild: (List<Blog> data) => Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => BlogView(
                          blog: data[index],
                        ),
                        itemCount: data.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
