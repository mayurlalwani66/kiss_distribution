import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/functions.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_provider/user_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/app_snakbar.dart';
import 'package:k_distribution/presentation/common/common_widgets/common_elevated_button.dart';
import 'package:k_distribution/presentation/common/common_widgets/custom_dialog.dart';
import 'package:k_distribution/presentation/common/common_widgets/no_internet_widget.dart';
import 'package:k_distribution/presentation/edit_profile.dart/your_address.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/routes_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../../app/di.dart';
import '../common/common_widgets/circular_progress.dart';
import '../common/common_widgets/custom_textfeild.dart';
import '../resources/strings_manager.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, required this.onPopToHomeScreen});

  final void Function() onPopToHomeScreen;

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
  Widget build(BuildContext context) {
    final appPrefs = ref.watch(appPreferencesProvider);
    final markAsDefaultState = ref.watch(markAsDefaultProvider);
    final shippingAddressState = ref.watch(shippingAddressProvider);

    return Scaffold(
        backgroundColor: ColorManager.colorWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () async {
              Navigator.pop(context);
              widget.onPopToHomeScreen();
              if (shippingAddressState.error.toString() ==
                  ResponseMessage.NO_INTERNET_CONNECTION) {
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
                    builder: (ctx) {
                      return Consumer(builder: (context, ref, _) {
                        return Stack(
                          children: [
                            CustomDialog(
                                message:
                                    AppStrings.updateProfileConfirmationMsg,
                                onTapNo: () => Navigator.pop(context),
                                onTapYes: () async {
                                  if (ref
                                          .watch(userProvider)
                                          .error
                                          .toString() ==
                                      ResponseMessage.NO_INTERNET_CONNECTION) {
                                    Navigator.pop(context);
                                    AppSnackbar.show(context,
                                        ResponseMessage.NO_INTERNET_CONNECTION);
                                  } else {
                                    ref
                                        .read(userProvider.notifier)
                                        .updateUserProfile(UpdateUserUseCaseInput(
                                            appPrefs.getUserId(),
                                            appPrefs.getUserName(),
                                            firstNameController.text,
                                            lastNameController.text,
                                            emailController.text,
                                            appPrefs.getUserPassword(),
                                            phoneNumberController.text,
                                            phoneNumber2Controller.text,
                                            appPrefs.getUserRole(),
                                            appPrefs.getUserDob()!,
                                            appPrefs
                                                .getUserIsTermAndConditionAccept(),
                                            appPrefs.getUserPhoto(),
                                            appPrefs.getUserPhotoUrl(),
                                            appPrefs.getUserState(),
                                            appPrefs.getUserPincode(),
                                            appPrefs.getUserIsSuperAdmin(),
                                            appPrefs
                                                .getUserIsSingleOrganisation()));
                                    Navigator.pushReplacementNamed(
                                        context, Routes.homeRoute);
                                  }
                                }),
                            if (ref.watch(userProvider).isLoading == true)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          ColorManager.colorTransparentWhite),
                                  child: CircularProgressWidget(),
                                ),
                              )
                          ],
                        );
                      });
                    });
              }),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                                borderRadius:
                                    BorderRadius.circular(AppSize.s100)),
                            child: CircleAvatar(
                              radius: AppSize.s25,
                              backgroundColor: ColorManager.colorLightGray,
                              backgroundImage: appPrefs
                                      .getUserPhotoUrl()
                                      .isEmpty
                                  ? AssetImage(ImageAssets.profileImg)
                                  : NetworkImage(appPrefs.getUserPhotoUrl()),
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          label: AppStrings.firstName,
                          hintText: AppStrings.firstNameHint,
                          controller: firstNameController
                            ..text = appPrefs.getUserFirstName(),
                          borderColor: ColorManager.colorSoftBlue,
                          focusedBorderColor: ColorManager.colorSoftBlue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.firstNameError;
                            }
                            if (value.length > 50) {
                              return AppStrings.characterLimitError;
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          label: AppStrings.lastName,
                          hintText: AppStrings.lastNameHint,
                          controller: lastNameController
                            ..text = appPrefs.getUserLastName(),
                          borderColor: ColorManager.colorSoftBlue,
                          focusedBorderColor: ColorManager.colorSoftBlue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.lastNameError;
                            }
                            if (value.length > 50) {
                              return AppStrings.characterLimitError;
                            }
                            return null;
                          },
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
                            ..text = appPrefs.getUserPhoneNumber(),
                          borderColor: ColorManager.colorSoftBlue,
                          focusedBorderColor: ColorManager.colorSoftBlue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.phoneNumberError;
                            }
                            if (value.length == 10) {
                              return AppStrings.phoneNumberCharacterLimitError;
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          label: AppStrings.alternateMobileNumer,
                          hintText: AppStrings.alternateMobileNumerHint,
                          controller: phoneNumber2Controller
                            ..text = appPrefs.getUserPhoneNumber2(),
                          borderColor: ColorManager.colorSoftBlue,
                          focusedBorderColor: ColorManager.colorSoftBlue,
                        ),
                        CustomTextFormField(
                          label: AppStrings.email,
                          hintText: AppStrings.emailHint,
                          controller: emailController
                            ..text = appPrefs.getUserEmail(),
                          borderColor: ColorManager.colorSoftBlue,
                          focusedBorderColor: ColorManager.colorSoftBlue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.emailError;
                            }
                            if (isEmailValid(value)) {
                              return AppStrings.invalidEmail;
                            }
                            return null;
                          },
                        ),
                        shippingAddressState.error.toString() ==
                                ResponseMessage.NO_INTERNET_CONNECTION
                            ? NoInternetWidget(onRetry: () {
                                ref
                                    .read(shippingAddressProvider.notifier)
                                    .getAllShippingAddress();
                              })
                            : YourAddressWidget()
                      ],
                    ),
                  ),
                )),
            if (markAsDefaultState.isLoading)
              Positioned.fill(
                child: Container(
                  decoration:
                      BoxDecoration(color: ColorManager.colorTransparentWhite),
                  child: CircularProgressWidget(),
                ),
              ),
          ],
        ));
  }
}
