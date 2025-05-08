import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/presentation/common/common_provider/form_data_provider.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/app_snakbar.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/home/address/address_form.dart';
import 'package:k_distribution/presentation/home/address/change_address.dart';
import 'package:k_distribution/presentation/home/address_panel.dart';
import 'package:k_distribution/presentation/home/drawer.dart';
import 'package:k_distribution/presentation/home/home_page_provider.dart';
import 'package:k_distribution/presentation/home/home_widgets/total_amount_widget.dart';
import 'package:k_distribution/presentation/home/place_order.dart';
import 'package:k_distribution/presentation/home/product_list.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';
import '../common/common_widgets/error_retry_widget.dart';
import '../common/common_widgets/no_internet_widget.dart';
import '../common/freezed_data_class/freezed_data_class.dart';

class HomeScreen extends ConsumerStatefulWidget {
  List<OrderDetails>? orderDetails;
  HomeScreen({super.key, this.orderDetails});

  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  // int cartQty = 0;
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
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _bind() async {
    final homeProviderNotifier = ref.read(homePageProvider.notifier);
    await homeProviderNotifier.initializeHomePage(
        orderDetails: widget.orderDetails);
  }

  void _showAddressBottomSheet(
      BuildContext context,
      List<ShippingAddress> shippingAddresses,
      ShippingAddress? selectedAddress) {
    final notifier = ref.watch(shippingAddressProvider.notifier);
    ref.read(markAsDefaultProvider.notifier).reset();

    if (selectedAddress != null) {
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return Consumer(builder: (context, ref, _) {
            final isLoading = ref.watch(markAsDefaultProvider).maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
            return ChangeAddress(
              isLoading: isLoading,
              shippingAddresses: shippingAddresses,
              onSelectAddress: (ShippingAddress address) async {
                hasInternet = await InternetConnection().hasInternetAccess;
                if (hasInternet == true) {
                  await ref
                      .read(markAsDefaultProvider.notifier)
                      .markAsDefault(address.id!);

                  ref
                      .read(shippingAddressProvider.notifier)
                      .setSelectedAddress(address);

                  Future.microtask(() {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  });
                } else {
                  if (context.mounted) {
                    Navigator.pop(context);
                    AppSnackbar.show(
                        context, ResponseMessage.NO_INTERNET_CONNECTION);
                  }
                }
              },
            );
          });
        },
      );
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (ctx) => AddressForm(),
      ).then((_) => notifier.getAllShippingAddress());
    }
  }

  void _showPlaceOrderSheet(
    BuildContext context,
    HomePageNotifier homeProviderNotifier,
    AsyncValue<HomePageState> homeState,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Consumer(
          builder: (context, ref, _) {
            final homeState = ref.watch(homePageProvider);

            final isLoading = homeProviderNotifier.isScreenLoading();

            return Stack(
              children: [
                PlaceOrder(
                  grandTotal: homeProviderNotifier.getGrandTotal(),
                  totalAmount: homeProviderNotifier.getTotalAmount(),
                  shippingCharges: homeProviderNotifier.getShippingCharge(),
                  onTap: () async {
                    if (homeState.hasError) {
                      AppSnackbar.show(context, homeState.error.toString());
                      return;
                    }

                    await homeProviderNotifier.createOrderApi(context);
                    homeProviderNotifier.totalCartQty;
                  },
                ),
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.colorTransparentWhite),
                      child: CircularProgressWidget(),
                    ),
                  )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProviderNotifier = ref.read(homePageProvider.notifier);
    final shippingState = ref.watch(shippingAddressProvider);
    final homePageState = ref.watch(homePageProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.colorLightGray4,
        appBar: _buildAppBar(),
        endDrawer: DrawerView(
          onPopToHomeScreen: () async {
            homeProviderNotifier.resetCartQuantities();
            widget.orderDetails = [];
            _checkInternetAndBind();
          },
        ),
        endDrawerEnableOpenDragGesture: false,
        drawerScrimColor:
            ColorManager.colorWhite.withValues(alpha: AppSize.s0_65),
        bottomNavigationBar: homeProviderNotifier.getTotalItems() == 0
            ? const SizedBox.shrink()
            : TotalAmountWidget(
                onTap: () => _showPlaceOrderSheet(
                    context, homeProviderNotifier, homePageState),
                totalItems: homeProviderNotifier.getTotalItems(),
                grandTotal: homeProviderNotifier.getGrandTotal(),
                onTotalAmountCalculated: () async {
                  await ref
                      .read(formDataControlKeyProvider.notifier)
                      .getDynamicFormDataByControlKeys(ref);
                  await homeProviderNotifier.getAllShippingCharges();
                },
              ),
        body: hasInternet
            ? Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShippingSection(
                          context,
                          shippingState.value?.shippingAddresses ?? [],
                          shippingState.value?.selectedAddress),
                      _buildProductList(homePageState, homeProviderNotifier),
                    ],
                  ),
                ],
              )
            : NoInternetWidget(onRetry: _checkInternetAndBind),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.colorWhite,
      toolbarHeight: AppSize.s75,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p12),
        child: Image.asset(ImageAssets.logoImg),
      ),
      leadingWidth: AppSize.s80,
    );
  }

  Widget _buildShippingSection(
      BuildContext context,
      List<ShippingAddress> shippingAddresses,
      ShippingAddress? selectedAddress) {
    return AddressPanel(
      selectedAddress: selectedAddress,
      addresses: shippingAddresses,
      onTap: () =>
          _showAddressBottomSheet(context, shippingAddresses, selectedAddress),
    );
  }

  Widget _buildProductList(AsyncValue<HomePageState> homeState,
      HomePageNotifier homeProviderNotifier) {
    return Expanded(
      child: homeState.when(
        loading: () => CircularProgressWidget(),
        error: (error, stackTrace) {
          if (error.toString() == ResponseMessage.NO_INTERNET_CONNECTION) {
            return NoInternetWidget(
              onRetry: () {
                homeProviderNotifier.getAllProducts();
              },
            );
          }
          return ErrorRetryWidget(
            message: error.toString(),
            onRetry: () {
              homeProviderNotifier.getAllProducts();
            },
          );
        },
        data: (products) => ProductList(
          products: products.products,
          increaseQuantity: (productId) {
            final hasAddress = ref
                    .read(shippingAddressProvider)
                    .asData
                    ?.value
                    .selectedAddress !=
                null;
            if (hasAddress) {
              homeProviderNotifier.increment(productId);
              if (homeState.error != ResponseMessage.NO_INTERNET_CONNECTION) {
                if (homeProviderNotifier.getShippingCharge() > 0 ||
                    homeProviderNotifier.totalCartQty > 1) {
                  homeProviderNotifier.getAllShippingCharges();
                }
              }
            } else {
              AppSnackbar.show(context, AppStrings.addressRequiredMsg);
            }
          },
          decreaseQuantity: (productId) {
            homeProviderNotifier.decrement(productId);
          },
          totalAmount: homeProviderNotifier.getSingleProductTotalAmount,
        ),
      ),
    );
  }
}
