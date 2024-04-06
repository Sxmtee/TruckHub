import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Utils/spacing.dart';
import 'package:trucks/Common/Widgets/custom_button.dart';
import 'package:trucks/Common/Widgets/textarea.dart';
import 'package:trucks/Features/Auth/controllers/auth_controllers.dart';
import 'package:trucks/Features/Auth/widgets/custom_text.dart';

class DriverLogin extends ConsumerStatefulWidget {
  final VoidCallback back;
  const DriverLogin({super.key, required this.back});

  @override
  ConsumerState<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends ConsumerState<DriverLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  void passwordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void loginUser() {
    ref.read(authControllerProvider).signDriverIn(
          context: context,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  inputText: 'Welcome back!',
                  fontSize: 24,
                  weight: FontWeight.w600,
                  colorName: Theme.of(context).iconTheme.color!,
                ),
                SpacingManager.h25,
                TextAreas(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscure: false,
                  keyboard: TextInputType.emailAddress,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  validator: (email) {
                    final emailValid = EmailValidator.validate(email!);
                    if (!emailValid) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextAreas(
                  maxLines: 1,
                  minLines: 1,
                  controller: passwordController,
                  hintText: 'Password',
                  obscure: showPassword ? false : true,
                  keyboard: TextInputType.visiblePassword,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: passwordVisibility,
                    icon: showPassword
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
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
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: customTextPppinsSpacing(
                      height: 24 / 16,
                      inputText: 'Forgot password?',
                      fontSize: 12,
                      weight: FontWeight.w800,
                      colorName: AppColors.tertiaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 63),
                  child: OnboardingButton(
                    onPressed: loginUser,
                    child: customTextPppinsSpacing(
                      height: 24 / 16,
                      inputText: 'Login',
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
                      inputText: 'Don\'t have an account?',
                      fontSize: 14,
                      weight: FontWeight.w500,
                      colorName: Theme.of(context).iconTheme.color!,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.back,
                      child: customTextPppinsSpacing(
                        height: 24 / 14,
                        inputText: 'Create Account',
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
