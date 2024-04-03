// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Utils/spacing.dart';
import 'package:trucks/Common/Widgets/custom_button.dart';
import 'package:trucks/Common/Widgets/textfield.dart';
import 'package:trucks/Features/Auth/controllers/auth_controllers.dart';
import 'package:trucks/Features/Auth/screens/login.dart';
import 'package:trucks/Features/Auth/widgets/custom_text.dart';

class SignUp extends ConsumerStatefulWidget {
  static const routeName = "/Sign-up";
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  void passwordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void signUserUp() {
    ref.read(authControllerProvider).signUserUp(
          context: context,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingManager.h38,
                customTextPppinsSpacing(
                  height: 32 / 24,
                  inputText: 'Welcome to TruckHub!',
                  fontSize: 24,
                  weight: FontWeight.w600,
                  colorName: AppColors.blackColor,
                ),
                SpacingManager.h7,
                customTextPppinsSpacing(
                  height: 28 / 24,
                  inputText: 'Create an account',
                  fontSize: 20,
                  weight: FontWeight.w500,
                  colorName: AppColors.blackColor,
                ),
                SpacingManager.h25,
                CustomTextField2(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField2(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    final emailValid = EmailValidator.validate(val!);
                    if (!emailValid) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField2(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: showPassword ? false : true,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onPressed: passwordVisibility,
                  validator: (password) {
                    RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    );
                    if (password != null &&
                        !regex.hasMatch(passwordController.text)) {
                      return 'Password should contain at least \n One uppercase \n One lowercase \n One digit \n One special symbol \n 8 characters in length';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 63),
                  child: OnboardingButton(
                    onPressed: () {
                      signUserUp();
                    },
                    child: customTextPppinsSpacing(
                      height: 24 / 16,
                      inputText: 'Create an account',
                      fontSize: 16,
                      weight: FontWeight.w800,
                      colorName: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextPppinsSpacing(
                      height: 24 / 14,
                      inputText: 'Have an account?',
                      fontSize: 14,
                      weight: FontWeight.w500,
                      colorName: AppColors.blackColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: customTextPppinsSpacing(
                        height: 24 / 14,
                        inputText: 'Login',
                        fontSize: 14,
                        weight: FontWeight.w400,
                        colorName: AppColors.tertiaryColor,
                      ),
                    ),
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
