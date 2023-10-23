import 'package:blog_viewer/components/blog-view.dart';
import 'package:blog_viewer/models/blog.dart';
import 'package:blog_viewer/services/bolg-service.dart';
import 'package:blog_viewer/utils/handle-network-state.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
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
