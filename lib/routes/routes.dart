import 'package:blog_viewer/screens/auth.dart';
import 'package:blog_viewer/screens/details.dart';
import 'package:blog_viewer/screens/home.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: Home.routeName,
      page: () => const Home(),
    ),
    GetPage(
      name: Details.routeName,
      page: () => const Details(),
    ),
    GetPage(
      name: Auth.routeName,
      page: () => Auth(),
    ),
  ];
}
