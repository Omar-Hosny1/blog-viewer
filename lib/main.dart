import 'package:blog_viewer/controllers/auth-controller.dart';
import 'package:blog_viewer/routes/routes.dart';
import 'package:blog_viewer/screens/auth.dart';
import 'package:blog_viewer/screens/home.dart';
import 'package:blog_viewer/screens/splash.dart';
import 'package:blog_viewer/utils/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Viewer',
      initialBinding: AppBinding(),
      getPages: Routes.routes,
      home: GetBuilder<AuthController>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.getInitialRoute(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Splash();
              } else if (snapshot.data == Auth.routeName) {
                return Auth();
              } else {
                return const Home();
              }
            },
          );
        },
      ),
    );
  }
}
