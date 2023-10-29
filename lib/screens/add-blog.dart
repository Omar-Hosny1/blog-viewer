import 'package:blog_viewer/components/base-button.dart';
import 'package:blog_viewer/components/base-input.dart';
import 'package:blog_viewer/controllers/add-blog-controller.dart';
import 'package:blog_viewer/utils/colors.dart';
import 'package:blog_viewer/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBlog extends StatelessWidget {
  AddBlog({super.key});

  static const routeName = '/add-blog';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _enteredTitle;
  String? _enteredBody;
  final RxBool isLoading = false.obs;

  _onSubmitForm() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != true) {
      return;
    }
    _formKey.currentState?.save();
    isLoading.value = true;

    await AddBlogController.to.addBlogHandler(
      body: _enteredBody!,
      title: _enteredTitle!,
    );

    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: PrimaryColor,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                BaseInput(
                  label: 'Title',
                  validator: validateText,
                  onSaved: (value) => _enteredTitle = value,
                ),
                const SizedBox(
                  height: 10,
                ),
                BaseInput(
                  label: 'Body',
                  validator: validateText,
                  onSaved: (value) => _enteredBody = value,
                ),
                const SizedBox(
                  height: 10,
                ),
                BaseButton(
                  onClick: _onSubmitForm,
                  isLoading: isLoading.value,
                  label: 'Add Blog',
                  withIcon: false,
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(25),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
