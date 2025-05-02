import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/presentation/edit_profile.dart/edit_profile.dart';
import 'package:k_distribution/presentation/resources/routes_manager.dart';

import '../../app/di.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class DrawerView extends ConsumerWidget {
  DrawerView({super.key, required this.onPopToHomeScreen});

  void Function() onPopToHomeScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appPrefs = ref.read(appPreferencesProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width * AppSize.s0_75,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s10),
            bottomLeft: Radius.circular(AppSize.s10),
          ),
        ),
        backgroundColor: ColorManager.colorWhite,
        elevation: AppSize.s10,
        shadowColor: ColorManager.colorBlack,
        child: Column(
          children: [
            Container(
              height: AppSize.s150,
              padding: const EdgeInsets.all(AppPadding.p16),
              decoration: BoxDecoration(
                color: ColorManager.colorPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s10),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppSize.s2,
                                color: ColorManager.colorYellowBorder),
                            borderRadius: BorderRadius.circular(AppSize.s100)),
                        child: CircleAvatar(
                          radius: AppSize.s25,
                          backgroundColor: ColorManager.colorLightGray,
                          backgroundImage: appPrefs.getUserPhotoUrl().isEmpty
                              ? AssetImage(ImageAssets.profileImg)
                              : NetworkImage(appPrefs.getUserPhotoUrl())
                                  as ImageProvider,
                        ),
                      ),
                      const SizedBox(width: AppSize.s12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSize.s2),
                            Text(
                              "${appPrefs.getUserFirstName()} ${appPrefs.getUserLastName()}"
                                  .toCapitalize(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getBoldStyle(
                                  color: ColorManager.colorWhite,
                                  fontSize: FontSize.s18),
                            ),
                            const Spacer(),
                            Text(
                              appPrefs.getUserEmail().toCapitalize(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getRegularStyle(
                                  color: ColorManager.colorWhite,
                                  fontSize: FontSize.s12),
                            ),
                            ...[
                              const SizedBox(height: AppSize.s10),
                              Text(
                                appPrefs.getUserPhoneNumber().toCapitalize(),
                                style: getRegularStyle(
                                    color: ColorManager.colorWhite,
                                    fontSize: FontSize.s12),
                              ),
                            ],
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return EditProfileScreen(
                                      onPopToHomeScreen: () {
                                        onPopToHomeScreen();
                                      },
                                    );
                                  }),
                                );
                              },
                              child: Container(
                                width: AppSize.s100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p10,
                                    vertical: AppPadding.p5),
                                decoration: BoxDecoration(
                                  color: ColorManager.colorTransparentBlack,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s30),
                                ),
                                child: Text(
                                  AppStrings.editYourProfile.toCapitalize(),
                                  overflow: TextOverflow.ellipsis,
                                  style: getRegularStyle(
                                    color: ColorManager.colorWhite,
                                    fontSize: FontSize.s12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: AppSize.s0,
                      right: AppSize.s0,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        child: Container(
                          height: AppSize.s30,
                          width: AppSize.s30,
                          decoration: BoxDecoration(
                            color:
                                ColorManager.colorWhite.withValues(alpha: 0.11),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.close,
                            size: AppSize.s20,
                            color: ColorManager.colorWhite,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: AppSize.s15),
            ListTile(
              leading: Image.asset(
                ImageAssets.locationImg,
                height: AppSize.s20,
                width: AppSize.s20,
              ),
              title: Text(AppStrings.myAddress,
                  style: getBoldStyle(
                      color: ColorManager.colorBlack, fontSize: FontSize.s16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        onPopToHomeScreen: () {
                          onPopToHomeScreen();
                        },
                      ),
                    ));
              },
            ),
            ListTile(
              leading: Image.asset(
                ImageAssets.orderImg,
                height: AppSize.s20,
                width: AppSize.s20,
              ),
              title: Text(AppStrings.myOrders,
                  style: getBoldStyle(
                      color: ColorManager.colorBlack, fontSize: FontSize.s16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.orderListRoute);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImageAssets.logoutImg,
                height: AppSize.s20,
                width: AppSize.s20,
              ),
              title: Text(AppStrings.logout,
                  style: getBoldStyle(
                      color: ColorManager.colorBlack, fontSize: FontSize.s16)),
              onTap: () {
                ref.read(appPreferencesProvider).removeToken();
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
