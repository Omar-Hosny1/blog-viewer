import 'package:blog_viewer/components/base-button.dart';
import 'package:blog_viewer/components/info-card.dart';
import 'package:blog_viewer/models/blog.dart';
import 'package:blog_viewer/services/bolg-service.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/handle-network-state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  const Details({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments ?? 1;
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PrimaryColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(
            'assets/icons/back.png',
          ),
        ),
        title: Text(id.toString()),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(child: Image.asset("assets/icons/overlyB.png")),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                FutureBuilder(
                  future: BlogService.getBlog(id.toString()),
                  builder: (context, snapshot) => handleNetworkState(
                    snapshot: snapshot,
                    buildChild: (Blog blog) => Column(
                      children: [
                        InfoCard(
                          text: blog.title,
                          withDivider: true,
                          withCopy: true,
                          copyColor: SecondaryColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InfoCard(
                          text: blog.body,
                          textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          withCopy: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: BaseButton(
                    onClick: Get.back,
                    label: 'Back',
                    imagePath: 'assets/icons/thunder.png',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
