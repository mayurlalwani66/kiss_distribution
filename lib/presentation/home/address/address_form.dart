import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/functions.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_provider/user_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/error_text_widget.dart';
import 'package:k_distribution/presentation/common/common_widgets/custom_textfeild.dart';
import '../../common/common_provider/form_data_provider.dart';
import '../../common/common_widgets/common_elevated_button.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'package:k_distribution/domain/model/user_model.dart';

class AddressForm extends ConsumerStatefulWidget {
  AddressForm({super.key, this.isFromHomeScreen, this.shippingData});

  bool? isFromHomeScreen = true;
  ShippingAddress? shippingData;

  @override
  ConsumerState<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends ConsumerState<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _suburbController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _postCodeController = TextEditingController();
  bool isDefault = false;
  String selectedState = "";
  String typeOfAddress = AppStrings.home;
  int id = 0;

  @override
  void initState() {
    super.initState();
    final addressProvider = ref.read(shippingAddressProvider.notifier);

    Future.microtask(() {
      addressProvider.getAllShippingAddress();
      addressProvider.getAllStates();
    });
    showCurrentData();
  }

  void showCurrentData() {
    if (widget.isFromHomeScreen == false) {
      id = widget.shippingData!.id!;
      _streetController.text = widget.shippingData!.addressLineOne;
      _suburbController.text = widget.shippingData!.addressLineTwo;
      _postCodeController.text = widget.shippingData!.pincode;
      selectedState = widget.shippingData!.state;
      typeOfAddress = widget.shippingData!.typeOfAddress;
      isDefault = widget.shippingData!.isDefault;
    }
  }

  @override
  Widget build(BuildContext context) {
    var addressProvider = ref.watch(shippingAddressProvider.notifier);
    User? userdetails = ref.read(userProvider).asData?.value;

    return FractionallySizedBox(
      heightFactor: AppSize.s0_9,
      child: Padding(
        padding: EdgeInsets.only(
          top: AppPadding.p16,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formHeader(context),
            Expanded(
              child: formFeilds(userdetails!),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p2,
                top: AppPadding.p10,
              ),
              child: CommonElevatedButton(
                  text: AppStrings.submit,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.isFromHomeScreen == true) {
                        await addressProvider.addShippingAddress(
                            AddShippingAddressInput(
                                _receiverNameController.text,
                                _phoneNumberController.text,
                                _postCodeController.text,
                                selectedState,
                                _streetController.text,
                                _suburbController.text,
                                typeOfAddress,
                                userdetails.id,
                                isDefault,
                                true));
                      } else {
                        await addressProvider.updateShippingAddress(
                            UpdateShippingAddressUseCaseInput(
                                "${widget.shippingData?.id}",
                                id,
                                _receiverNameController.text,
                                _phoneNumberController.text,
                                _postCodeController.text,
                                selectedState,
                                _streetController.text,
                                _suburbController.text,
                                typeOfAddress,
                                userdetails.id,
                                isDefault,
                                true));
                      }

                      await addressProvider.getAllShippingAddress();

                      if (context.mounted) {
                        context.router.pop();
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget formFeilds(User userdetails) {
    var formdata = ref.read(formDataStoreProvider);

    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: AppPadding.p10),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.typesOfAddress,
                        style: getRegularStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s12)),
                    const SizedBox(height: AppSize.s15),
                    addressTypeBadge(),
                    const SizedBox(height: AppSize.s20),
                    CustomTextFormField(
                      keyboardType: TextInputType.streetAddress,
                      label: AppStrings.streetNameAndNo,
                      hintText: AppStrings.streetNameAndNo,
                      controller: _streetController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.streetNameError;
                        }

                        if (value.length > 150) {
                          return AppStrings.fullNameCharacterLimitError;
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.streetAddress,
                      label: AppStrings.suburb,
                      hintText: AppStrings.suburb,
                      controller: _suburbController,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      label: AppStrings.receiverName,
                      hintText: AppStrings.receiverName,
                      controller: _receiverNameController
                        ..text =
                            "${userdetails.firstName} ${userdetails.lastName}",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.fullNameError;
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      label: AppStrings.phoneNumber,
                      hintText: AppStrings.phoneNumber,
                      controller: _phoneNumberController
                        ..text = userdetails.phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.phoneNumberError;
                        }

                        if (value.length != 10) {
                          return AppStrings.phoneNumberCharacterLimitError;
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      label: AppStrings.postCode,
                      hintText: AppStrings.postCode,
                      controller: _postCodeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          if (formdata.addressLevel1 == 'Australia') {
                            if (isFourDigitsPincode(value!)) {
                              return AppStrings.postCode4digitsError;
                            }
                          }
                          if (isSixDigitsPincode(value!)) {
                            return AppStrings.postCode6digitsError;
                          }
                          return AppStrings.postCodeError;
                        }

                        return null;
                      },
                    ),
                    Text(AppStrings.state,
                        style: getRegularStyle(
                            color: ColorManager.colorTextFieldLabel,
                            fontSize: AppSize.s12)),
                    statesDropdown(),
                    const SizedBox(height: AppSize.s10),
                    checkboxWidget(),
                    const SizedBox(height: AppSize.s10),
                  ],
                ))));
  }

  Widget checkboxWidget() {
    return Row(
      children: [
        Checkbox(
          value: isDefault,
          onChanged: (value) => setState(() => isDefault = !isDefault),
        ),
        Text(
          "Mark As Default",
          style: getBoldStyle(
            color: ColorManager.colorBlack,
            fontSize: FontSize.s14,
          ),
        ),
      ],
    );
  }

  Widget formHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.addressForm,
          style: getBoldStyle(
            color: ColorManager.colorBlack,
            fontSize: FontSize.s16,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget statesDropdown() {
    var shippingState = ref.watch(shippingAddressProvider);
    return shippingState.when(
      data: (data) {
        return DropdownButtonFormField<String>(
          value: selectedState.isEmpty ? null : selectedState,
          isDense: true,
          dropdownColor: ColorManager.colorWhite,
          hint: Text(AppStrings.enterYourState),
          items: data?.states
              .map((state) => DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: state.value,
                    child: Text(state.name),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedState = value!;
            });
          },
          validator: (value) =>
              (value == null || value.isEmpty) ? AppStrings.stateError : null,
        );
      },
      loading: () => CircularProgressWidget(),
      error: (error, stackTrace) {
        return ErrorTextWidget(error: error.toString());
      },
    );
  }

  Widget addressTypeBadge() {
    return Row(children: [
      badgeWidget(
          assetPath: ImageAssets.homeFillImg,
          label: AppStrings.home,
          isSelected: typeOfAddress == AppStrings.home,
          onTap: () {
            setState(() {
              typeOfAddress = AppStrings.home;
            });
          }),
      const SizedBox(width: AppSize.s10),
      badgeWidget(
          assetPath: ImageAssets.officeFillImg,
          label: AppStrings.office,
          isSelected: typeOfAddress == AppStrings.office,
          onTap: () {
            setState(() {
              typeOfAddress = AppStrings.office;
            });
          }),
    ]);
  }

  Widget badgeWidget(
      {required String assetPath,
      required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.colorPrimary
              : ColorManager.colorTextFieldLabel,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Row(
          children: [
            Image.asset(assetPath, width: AppSize.s15),
            const SizedBox(width: AppSize.s5),
            Text(
              label,
              style: getRegularStyle(
                color: ColorManager.colorWhite,
                fontSize: FontSize.s14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
