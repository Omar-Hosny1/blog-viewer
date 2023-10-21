import 'package:blog_viewer/screens/details.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:blog_viewer/models/blog.dart';
import 'package:get/get.dart';

class BlogView extends StatelessWidget {
  BlogView({super.key, required this.blog});
  
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        Positioned(
          left: 0,
          child: Image.asset(
            'assets/icons/overly.png',
          ),
        ),
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    blog.title.length > 10
                        ? blog.title.substring(0, 10).toUpperCase()
                        : blog.title,
                    style: TextStyle(
                      color: SecondaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/go.png',
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  blog.body.length > 60
                      ? blog.body.substring(0, 60)
                      : blog.body,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          child: InkWell(
            onTap: () {
              Get.toNamed(
                Details.routeName,
                arguments: blog.id,
              );
            },
            child: SizedBox(
              width: 20,
              child: Image.asset(
                'assets/icons/arrow.png',
              ),
            ),
          ),
          right: 25,
          bottom: 15,
        )
      ],
    );
  }
}
