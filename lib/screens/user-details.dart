import 'package:blog_viewer/components/base-button.dart';
import 'package:blog_viewer/components/info-card.dart';
import 'package:blog_viewer/models/user.dart';
import 'package:blog_viewer/services/user-service.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/handle-network-state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});
  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    final int userId = Get.arguments;

    return SafeArea(
      child: Scaffold(
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
          title: Text(userId.toString()),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Stack(
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
                      future: UserService.fetchUserData(userId.toString()),
                      builder: (context, snapshot) => handleNetworkState(
                        snapshot: snapshot,
                        buildChild: (User user) => Column(
                          children: [
                            InfoCard(
                              text: user.name,
                              withDivider: true,
                              withCopy: true,
                              copyColor: SecondaryColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InfoCard(
                              text: user.email,
                              textStyle: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                              withCopy: true,
                            ),
                            InfoCard(
                              text: user.phone,
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
                        withIcon: false,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
