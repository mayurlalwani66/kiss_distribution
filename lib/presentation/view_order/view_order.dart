import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/domain/usecase/order_usecase.dart';
import 'package:k_distribution/presentation/common/common_widgets/app_snakbar.dart';

import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/error_text_widget.dart';
import 'package:k_distribution/presentation/common/common_widgets/no_internet_widget.dart';
import 'package:k_distribution/presentation/home/home_page.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/view_order/amount_widget.dart';
import 'package:k_distribution/presentation/view_order/billing_address_widget.dart';
import 'package:k_distribution/presentation/view_order/feedback_widget.dart';
import 'package:k_distribution/presentation/view_order/order_information_widget.dart';
import 'package:k_distribution/presentation/view_order/product_list_widget.dart';
import 'package:k_distribution/presentation/view_order/query_panel_widget.dart';
import 'package:k_distribution/presentation/view_order/shipment_detail_widget.dart';
import 'package:k_distribution/presentation/view_order/shipping_address_widget.dart';
import 'package:k_distribution/presentation/view_order/source_address.dart';
import 'package:k_distribution/presentation/view_order/transaction_list_widget.dart';
import 'package:k_distribution/presentation/view_order/view_order_provider.dart';

import '../common/common_provider/form_data_provider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'pickup_address.dart';

class ViewOrderScreen extends ConsumerStatefulWidget {
  String? orderId;

  ViewOrderScreen({super.key, this.orderId});

  @override
  ConsumerState<ViewOrderScreen> createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends ConsumerState<ViewOrderScreen> {
  bool hasInternet = true;
  @override
  void initState() {
    super.initState();
    Future.microtask(_checkInternetAndBind);
  }

  Future<void> _checkInternetAndBind() async {
    hasInternet = await InternetConnection().hasInternetAccess;
    if (hasInternet) {
      await _bind();
    }
    setState(() {});
  }

  _bind() async {
    final viewProvider = ref.read(viewOrderProvider.notifier);
    await viewProvider.getOrderById(widget.orderId!);

    await viewProvider.getTransactionByOrderId(widget.orderId!);
    final shipmentId = viewProvider.getShipmentId();

    if (shipmentId != 0) {
      await viewProvider.getShipmentById(shipmentId.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewProvider = ref.watch(viewOrderProvider);
    final formData = ref.watch(formDataStoreProvider);

    return hasInternet == false
        ? Scaffold(body: NoInternetWidget(onRetry: _checkInternetAndBind))
        : viewProvider.when(
            loading: () => Scaffold(
                backgroundColor: ColorManager.colorLightGray4,
                body: CircularProgressWidget()),
            error: (error, stackTrace) => Scaffold(
                backgroundColor: ColorManager.colorLightGray4,
                body: ErrorTextWidget(error: error.toString())),
            data: (data) {
              var order = data.viewOrder;
              if (order == null) {
                return Scaffold(
                  backgroundColor: ColorManager.colorLightGray4,
                  appBar: AppBar(
                    title: const Text(AppStrings.orderDetails),
                  ),
                  body: Center(
                    child: Text(
                      AppStrings.orderNotFound,
                      style: getBoldStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.colorErrorRed),
                    ),
                  ),
                );
              }

              return Scaffold(
                  backgroundColor: ColorManager.colorLightGray4,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: AppMargin.m8, left: AppMargin.m16),
                                  child: Image.asset(ImageAssets.backImg,
                                      width: AppSize.s10)),
                              Text("#${order.orderNo}"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: AppMargin.m15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(AppSize.s100),
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (ctx) => HomeScreen(
                                      orderDetails: order.orderDetails),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Container(
                              height: AppSize.s35,
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p6,
                                horizontal: AppPadding.p20,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.colorPrimary,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s100),
                              ),
                              child: Text(
                                AppStrings.reorder,
                                style: getRegularStyle(
                                  fontSize: FontSize.s13,
                                  color: ColorManager.colorWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    titleTextStyle: getBoldStyle(
                        color: ColorManager.colorBlack, fontSize: FontSize.s16),
                    titleSpacing: AppSize.s0,
                  ),
                  body: hasInternet == false
                      ? NoInternetWidget(onRetry: _checkInternetAndBind)
                      : SingleChildScrollView(
                          physics: Platform.isIOS
                              ? ClampingScrollPhysics()
                              : ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              OrderInformationWidget(
                                orderNo: order.orderNo,
                                orderCreateDate: order.createDate,
                                paymentStatus: order.paymentStatus,
                                orderType: order.orderType,
                                orderStatus: order.status,
                                userName: order.userName,
                                userPhoneNo: order.userPhoneNumber,
                                otp: order.otp,
                                addtionalDeliveryCharge:
                                    order.additionalDeliveryCharge.toDouble(),
                                onCallSupport: () {
                                  final phone = formData.supportPhone;
                                  if (phone.isNotEmpty) {
                                    ref
                                        .read(viewOrderProvider.notifier)
                                        .makePhoneCall(phone);
                                  }
                                },
                                lastOrderUpdate: order.lastOrderUpdate,
                                orderNote: order.orderNote,
                              ),
                              QueryPanelWidget(
                                supportEmail: formData.supportEmail,
                                supportPhone: formData.supportPhone,
                                onCallSupport: () {
                                  final phone = formData.supportPhone;
                                  if (phone.isNotEmpty) {
                                    ref
                                        .read(viewOrderProvider.notifier)
                                        .makePhoneCall(phone);
                                  }
                                },
                                onEmailSupport: () {
                                  final email = formData.supportEmail;
                                  if (email.isNotEmpty) {
                                    ref
                                        .read(viewOrderProvider.notifier)
                                        .makeEmail(email);
                                  }
                                },
                              ),
                              BillingAddressWidget(
                                  address: order.billingAddress),
                              if (order.shippingAddress != null)
                                ShippingAddressWidget(
                                    address: order.shippingAddress),
                              if (order.orderType == AppStrings.pickup)
                                Column(
                                  children: [
                                    const SizedBox(height: AppSize.s4),
                                    PickupAddress(
                                      storeName: formData.storeName,
                                      storePhoneNumber: formData.supportPhone,
                                      storeAddressLevel4:
                                          formData.addressLevel4,
                                      storeAddressLevel2:
                                          formData.addressLevel2,
                                      storePostalcode: formData.postalCode,
                                    ),
                                  ],
                                ),
                              ProductListWidget(
                                orderDetails: order.orderDetails,
                                canCancelOrder: formData.canCancelOrder,
                                canCancelOrderItems:
                                    formData.canCancelOrderItems,
                                onCancelDetails: (int id) {
                                  showCancelConfirmationDialog(context, () {
                                    ref
                                        .read(viewOrderProvider.notifier)
                                        .cancelOrder(
                                            id, int.parse(widget.orderId!));
                                  });
                                },
                              ),
                              const SizedBox(height: AppSize.s4),
                              TransactionListWidget(
                                transactionList: data.listTransactionById,
                                storeName: formData.storeName,
                              ),
                              if (data.shipmentModel?.id != 0 &&
                                  data.shipmentModel != null)
                                Column(
                                  children: [
                                    SourceAddressWidget(
                                        sourceAddress:
                                            data.shipmentModel?.sourceAddress),
                                    ShipmentDetailWidget(
                                        shipmentDetail: data.shipmentModel)
                                  ],
                                ),
                              if (order.status == AppStrings.completed)
                                FeedbackWidget(
                                  onSubmit: (String title, double rating,
                                      String description) async {
                                    hasInternet = await InternetConnection()
                                        .hasInternetAccess;
                                    if (hasInternet == true) {
                                      ref
                                          .watch(viewOrderProvider.notifier)
                                          .createFeedback(FeedbackUseCaseInput(
                                              title, description, rating));
                                    } else {
                                      if (context.mounted) {
                                        AppSnackbar.show(
                                            context,
                                            ResponseMessage
                                                .NO_INTERNET_CONNECTION);
                                      }
                                    }
                                  },
                                ),
                              const SizedBox(height: AppSize.s2),
                              AmountWidget(
                                totalGrossAmount: "${order.totalGrossAmount}",
                                shippingCharge: order.shippingCharges,
                                orderType: order.orderType,
                                grandTotal:
                                    "${(order.fulfilledAmount > 0 ? order.fulfilledAmount : order.totalAmount)}",
                                isShippingOnCustomer:
                                    order.isShippingOnCustomer,
                                additionalDeliveryCharge:
                                    order.additionalDeliveryCharge.toDouble(),
                                shippingNotes: order.orderShippingNotes,
                              ),
                            ],
                          ),
                        ));
            },
          );
  }
}

void showCancelConfirmationDialog(
    BuildContext context, VoidCallback onConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text(AppStrings.cancelOrderConfirmationMsg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(AppStrings.no),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirmed();
            },
            child: const Text(AppStrings.yes),
          ),
        ],
      );
    },
  );
}
