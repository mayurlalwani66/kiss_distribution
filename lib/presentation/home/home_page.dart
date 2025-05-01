import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/app_snakbar.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/error_text_widget.dart';
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
import 'package:k_distribution/presentation/view_order/view_order.dart';
import '../../domain/usecase/product_usecase.dart';
import '../common/common_widgets/no_internet_widget.dart';
import '../common/freezed_data_class/freezed_data_class.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final List<OrderDetails>? orderDetails;
  const HomeScreen({super.key, this.orderDetails});

  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  int cartQty = 0;
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

  Future<void> _bind() async {
    final homeProvider = ref.read(homePageProvider.notifier);
    final shippingProvider = ref.read(shippingAddressProvider.notifier);
    final orderDetails = widget.orderDetails;

    await shippingProvider.getAllShippingAddress();
    await homeProvider.getAllPaymentMethods("all");
    await homeProvider.getAllProducts(
      ProductUseCaseInput(
          0, '', 0, false, [], 1, 1, 1000, '', 'desc', '', "PUBLISHED"),
    );

    if (ref.read(shippingAddressProvider).asData?.value.selectedAddress !=
        null) {
      await homeProvider.getAllShippingCharges();
    }
    if (orderDetails == null) return;
    if (orderDetails.isNotEmpty) {
      homeProvider.prefillCartQuantities(orderDetails);
    }
  }

  void _showAddressBottomSheet(
      BuildContext context,
      List<ShippingAddress> shippingAddresses,
      ShippingAddress? selectedAddress) {
    final notifier = ref.watch(shippingAddressProvider.notifier);

    if (selectedAddress != null) {
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (ctx) => ChangeAddress(shippingAddresses: shippingAddresses),
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
      BuildContext context, HomePageNotifier homeProvider) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => PlaceOrder(
        grandTotal: homeProvider.getGrandTotal(),
        totalAmount: homeProvider.getTotalAmount(),
        shippingCharges: homeProvider.getShippingCharge(),
        onTap: () async {
          if (ref.read(homePageProvider).hasError) {
            AppSnackbar.show(
                context, ref.read(homePageProvider).error.toString());
            return;
          }
          await homeProvider.createOrderApi();
          final orderId = homeProvider.getOrderId();
          if (orderId != null || orderId != 0) {
            if (context.mounted) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) =>
                          ViewOrderScreen(orderId: '$orderId'))).then((_) {
                homeProvider.resetCartQuantities();
                cartQty = 0;
              });
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.read(homePageProvider.notifier);
    final shippingState = ref.watch(shippingAddressProvider);
    final homePageState = ref.watch(homePageProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.colorLightGray4,
        appBar: _buildAppBar(),
        endDrawer: const DrawerView(),
        endDrawerEnableOpenDragGesture: false,
        drawerScrimColor:
            ColorManager.colorWhite.withValues(alpha: AppSize.s0_65),
        bottomNavigationBar: homeProvider.getTotalItems() == 0
            ? const SizedBox.shrink()
            : TotalAmountWidget(
                onTap: () => _showPlaceOrderSheet(context, homeProvider),
                totalItems: homeProvider.getTotalItems(),
                grandTotal: homeProvider.getGrandTotal(),
              ),
        body: hasInternet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShippingSection(
                      context,
                      shippingState.value?.shippingAddresses ?? [],
                      shippingState.value?.selectedAddress),
                  _buildProductList(homePageState, homeProvider),
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

  Widget _buildProductList(
      AsyncValue<HomePageState> homeState, HomePageNotifier homeProvider) {
    return Expanded(
      child: homeState.when(
        loading: () => CircularProgressWidget(),
        error: (error, stackTrace) => ErrorTextWidget(error: error.toString()),
        data: (products) => ProductList(
          products: products.products,
          increaseQuantity: (productId) async {
            final ctx = context;
            final isConnected = await InternetConnection().hasInternetAccess;

            if (!ctx.mounted) return;

            if (!isConnected) {
              AppSnackbar.show(ctx, ResponseMessage.NO_INTERNET_CONNECTION);
              return;
            }

            final hasAddress = ref
                    .read(shippingAddressProvider)
                    .asData
                    ?.value
                    .selectedAddress !=
                null;
            if (hasAddress) {
              homeProvider.increment(productId);
              cartQty++;
              if (homeProvider.getShippingCharge() == 0.0 && cartQty > 0) {
                await homeProvider.getAllShippingCharges();
              }
            } else {
              AppSnackbar.show(ctx, AppStrings.addressRequiredMsg);
            }
          },
          decreaseQuantity: (productId) async {
            final ctx = context;
            final isConnected = await InternetConnection().hasInternetAccess;

            if (!ctx.mounted) return;

            if (!isConnected) {
              AppSnackbar.show(ctx, ResponseMessage.NO_INTERNET_CONNECTION);
              return;
            }

            cartQty--;
            homeProvider.decrement(productId);
            if (homeProvider.getShippingCharge() > 0.0 && cartQty > 0) {
              await homeProvider.getAllShippingCharges();
            }
          },
          totalAmount: homeProvider.getSingleProductTotalAmount,
        ),
      ),
    );
  }
}
