import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/functions.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/common_elevated_button.dart';
import 'package:k_distribution/presentation/login/login_provider.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import '../common/common_widgets/app_utils.dart';
import '../common/common_widgets/clipper.dart';
import '../forgot_password/forgot_password.dart';
import '../resources/values_manager.dart';
import 'login_text_feild.dart';
import 'qr_scan.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var enteredEmail = "";
  var enteredPhone = "";
  var enteredPassword = "";

  @override
  void dispose() {
    super.dispose();
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.colorWhite,
        body: Stack(children: [
          loginWidget(context),
          if (loginState.isLoading)
            Container(
              decoration:
                  BoxDecoration(color: ColorManager.colorTransparentWhite),
              child: CircularProgressWidget(),
            ),
        ]),
      ),
    );
  }

  Widget loginWidget(BuildContext context) {
    return SingleChildScrollView(
      physics:
          Platform.isIOS ? ClampingScrollPhysics() : ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bannerImageWidget(),
          const SizedBox(height: AppSize.s40),
          loginFormWidget(context),
        ],
      ),
    );
  }

  Widget loginFormWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s20,
        vertical: AppSize.s16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.loginTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: FontSize.s34),
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              AppStrings.loginSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: FontSize.s14),
            ),
            const SizedBox(height: AppSize.s40),
            LoginTextFeild(
              labelText: AppStrings.emailOrPhoneHint,
              hintText: AppStrings.emailOrPhoneHint,
              controller: _emailOrPhoneController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.emailOrPhoneNumberError;
                }
                if (isEmailValid(value)) {
                  enteredEmail = _emailOrPhoneController.text;
                }
                if (isPhoneNumberValid(value)) {
                  enteredPhone = _emailOrPhoneController.text;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSize.s20),
            LoginTextFeild(
              labelText: AppStrings.password,
              hintText: AppStrings.enterYourPassword,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.passwordError;
                }

                if (_passwordController.text.isNotEmpty) {
                  enteredPassword = _passwordController.text;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSize.s20),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  AppUtils.bottomsheetView(
                    isDismissible: false,
                    context: context,
                    widget: ForgotPassword(),
                  );
                },
                child: Text(
                  "${AppStrings.forgotPassword}?",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: FontSize.s13),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s30),
            CommonElevatedButton(
                text: AppStrings.login,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ref.watch(loginProvider.notifier).login(
                          enteredEmail,
                          enteredPhone,
                          enteredPassword,
                        );
                  }
                }),
            const SizedBox(height: AppSize.s30),
            loginWithQrWidget(context)
          ],
        ),
      ),
    );
  }

  Widget loginWithQrWidget(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s52,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: ColorManager.colorPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const QrScannerScreen()),
          );
        },
        icon: Image.asset(
          ImageAssets.qrCodeImg,
          height: AppSize.s30,
        ),
        label: Text(
          AppStrings.loginWithQr,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget bannerImageWidget() {
    return ClipPath(
      clipper: CurveClipperBottom(curveDepth: AppSize.s70),
      child: Container(
        height: AppSize.s175,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.colorPrimary,
        ),
        child: Center(
          child: Image.asset(
            ImageAssets.logoLoginImg,
            width: AppSize.s150,
          ),
        ),
      ),
    );
  }
}
