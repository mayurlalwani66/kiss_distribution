import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_provider/user_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/common_elevated_button.dart';
import 'package:k_distribution/presentation/common/common_widgets/custom_dialog.dart';
import 'package:k_distribution/presentation/edit_profile.dart/your_address.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/routes_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../common/common_widgets/custom_textfeild.dart';
import '../resources/strings_manager.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final phoneNumber2Controller = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _bind() {
    Future.microtask(() =>
        ref.read(shippingAddressProvider.notifier).getAllShippingAddress());
  }

  @override
  Widget build(BuildContext context) {
    final userDetail = ref.watch(userProvider).value;

    return Scaffold(
        backgroundColor: ColorManager.colorWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: PopScope(
              canPop: true,
              onPopInvokedWithResult: (bool didPop, Object? result) {
                if (didPop) {
                  ref
                      .read(shippingAddressProvider.notifier)
                      .getAllShippingAddress();
                }
              },
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: AppMargin.m8, left: AppMargin.m16),
                      child:
                          Image.asset(ImageAssets.backImg, width: AppSize.s10)),
                  Text(AppStrings.yourProfile),
                ],
              ),
            ),
          ),
          titleTextStyle: getBoldStyle(
              color: ColorManager.colorBlack, fontSize: FontSize.s16),
          titleSpacing: AppSize.s0,
        ),
        bottomNavigationBar: BottomAppBar(
          color: ColorManager.colorWhite,
          child: CommonElevatedButton(
              text: AppStrings.update,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => CustomDialog(
                        message: AppStrings.updateProfileConfirmationMsg,
                        onTapNo: () => Navigator.pop(context),
                        onTapYes: () {
                          ref.read(userProvider.notifier).updateUserProfile(
                              UpdateUserUseCaseInput(
                                  userDetail!.id,
                                  userDetail.userName,
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  userDetail.password,
                                  phoneNumberController.text,
                                  phoneNumber2Controller.text,
                                  userDetail.role,
                                  userDetail.dob,
                                  userDetail.isTermAndConditionAccept,
                                  userDetail.photo,
                                  userDetail.photoUrl,
                                  userDetail.state,
                                  userDetail.pincode,
                                  userDetail.isSuperAdmin,
                                  userDetail.isSingleOrganisation));
                          Navigator.pushReplacementNamed(
                              context, Routes.homeRoute);
                        }));
              }),
        ),
        body: SingleChildScrollView(
            physics: Platform.isIOS
                ? ClampingScrollPhysics()
                : ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: AppSize.s70,
                        height: AppSize.s70,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppSize.s2,
                                color: ColorManager.colorYellowBorder),
                            borderRadius: BorderRadius.circular(AppSize.s100)),
                        child: CircleAvatar(
                          radius: AppSize.s25,
                          backgroundColor: ColorManager.colorLightGray,
                          backgroundImage: userDetail!.photoUrl.isEmpty
                              ? AssetImage(ImageAssets.profileImg)
                              : NetworkImage(userDetail.photoUrl),
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      label: AppStrings.firstName,
                      hintText: AppStrings.firstNameHint,
                      controller: firstNameController
                        ..text = userDetail.firstName,
                      borderColor: ColorManager.colorSoftBlue,
                      focusedBorderColor: ColorManager.colorSoftBlue,
                    ),
                    CustomTextFormField(
                      label: AppStrings.lastName,
                      hintText: AppStrings.lastNameHint,
                      controller: lastNameController
                        ..text = userDetail.lastName,
                      borderColor: ColorManager.colorSoftBlue,
                      focusedBorderColor: ColorManager.colorSoftBlue,
                    ),
                    Text(AppStrings.contactDetails,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s18)),
                    const SizedBox(height: AppSize.s25),
                    CustomTextFormField(
                      label: AppStrings.mobileNumber,
                      hintText: AppStrings.mobileNumerHint,
                      controller: phoneNumberController
                        ..text = userDetail.phoneNumber,
                      borderColor: ColorManager.colorSoftBlue,
                      focusedBorderColor: ColorManager.colorSoftBlue,
                    ),
                    CustomTextFormField(
                      label: AppStrings.alternateMobileNumer,
                      hintText: AppStrings.alternateMobileNumerHint,
                      controller: phoneNumber2Controller
                        ..text = userDetail.phoneNumberTwo,
                      borderColor: ColorManager.colorSoftBlue,
                      focusedBorderColor: ColorManager.colorSoftBlue,
                    ),
                    CustomTextFormField(
                      label: AppStrings.email,
                      hintText: AppStrings.emailHint,
                      controller: emailController..text = userDetail.email,
                      borderColor: ColorManager.colorSoftBlue,
                      focusedBorderColor: ColorManager.colorSoftBlue,
                    ),
                    YourAddressWidget(),
                  ],
                ),
              ),
            )));
  }
}
