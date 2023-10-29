import 'package:blog_viewer/components/base-button.dart';
import 'package:blog_viewer/components/base-input.dart';
import 'package:blog_viewer/controllers/auth-controller.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth extends StatelessWidget {
  Auth({super.key});
  static const String routeName = '/auth';

  final RxBool isLoginMode = true.obs;
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _enteredEmail;
  String? _enteredPassword;

  onSubmitForm() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) {
      return;
    }
    _formKey.currentState?.save();
    isLoading.value = true;

    if (isLoginMode.value == true) {
      await AuthController.to.signin(
        email: _enteredEmail!,
        password: _enteredPassword!,
      );
    } else {
      await AuthController.to.signup(
        email: _enteredEmail!,
        password: _enteredPassword!,
      );
    }
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: PrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                Center(child: Image.asset("assets/icons/overlyB.png")),
                Column(
                  children: [
                    Center(
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                BaseInput(
                                  label: 'Email',
                                  onSaved: (value) => _enteredEmail = value,
                                  validator: (value) => validateEmail(value ?? ''),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                BaseInput(
                                  label: 'Password',
                                  onSaved: (value) => _enteredPassword = value,
                                  isPassword: true,
                                  validator: (value) => validatePassword(value ?? ''),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Obx(
                                    () => BaseButton(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                          vertical: 15.0,
                                          horizontal: 60.0,
                                        ),
                                      ),
                                      isLoading: isLoading.value,
                                      onClick: isLoading.isTrue ? null : onSubmitForm,
                                      label: isLoginMode.isTrue ? 'Login' : 'Sign up',
                                      imagePath: 'assets/icons/login.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: BaseButton(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 60.0),
                                    ),
                                    styleVariants: ButtonStyleVariants.outline,
                                    onClick: () {
                                      isLoginMode.value = !isLoginMode.value;
                                    },
                                    label: 'Switch Mode',
                                    imagePath: 'assets/icons/signup.png',
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
