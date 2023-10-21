import 'package:blog_viewer/routes/routes.dart';
import 'package:blog_viewer/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  loadDotEnv() async {
    await dotenv.load(fileName: ".env");
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Viewer',
      getPages: Routes.routes,
      initialRoute: Auth.routeName,
    );
  }
}
