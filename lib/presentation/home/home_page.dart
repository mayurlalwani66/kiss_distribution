import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
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
import 'package:k_distribution/presentation/resources/routes_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';
import '../../domain/usecase/product_usecase.dart';
import '../common/freezed_data_classes/freezed_data_class.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  final List<OrderDetails>? orderDetails;
  const HomeScreen({super.key, this.orderDetails});

  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  int cartQty = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(_bind);
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

  void _showAddressBottomSheet(BuildContext context, ShippingState shipping) {
    final notifier = ref.watch(shippingAddressProvider.notifier);

    if (shipping.selectedAddress != null) {
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (ctx) =>
            ChangeAddress(shippingAddresses: shipping.shippingAddresses),
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
          await homeProvider.createOrderApi();
          final orderId = homeProvider.getOrderId();
          if (orderId != null || orderId != 0) {
            if (context.mounted) {
              context.router.pop();
              context.router
                  .push(ViewOrderRoute(orderId: "$orderId"))
                  .then((_) {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShippingSection(context, shippingState),
            _buildProductList(homePageState, homeProvider),
          ],
        ),
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
      BuildContext context, AsyncValue<ShippingState> shippingState) {
    return shippingState.when(
      loading: () => const SizedBox(),
      error: (error, _) => Text(error.toString()),
      data: (shipping) => AddressPanel(
        selectedAddress: shipping.selectedAddress,
        addresses: shipping.shippingAddresses,
        onTap: () => _showAddressBottomSheet(context, shipping),
      ),
    );
  }

  Widget _buildProductList(
    AsyncValue<HomePageState> homeState,
    HomePageNotifier homeProvider,
  ) {
    return Expanded(
      child: homeState.when(
        loading: () => const CircularProgressWidget(),
        error: (error, _) => ErrorTextWidget(error: error.toString()),
        data: (products) => ProductList(
          products: products.products,
          increaseQuantity: (productId) async {
            if (ref
                    .read(shippingAddressProvider)
                    .asData
                    ?.value
                    .selectedAddress !=
                null) {
              homeProvider.increment(productId);
              cartQty++;
              if (homeProvider.getShippingCharge() == 0.0 && cartQty > 0) {
                await homeProvider.getAllShippingCharges();
              }
            }
          },
          decreaseQuantity: (productId) {
            cartQty--;
            homeProvider.decrement(productId);
          },
          totalAmount: homeProvider.getSingleProductTotalAmount,
        ),
      ),
    );
  }
}
