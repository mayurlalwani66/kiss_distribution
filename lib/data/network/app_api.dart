import 'package:dio/dio.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/auth_response/auth_responses.dart';
import 'package:k_distribution/data/responses/product_response/product_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../app/constant.dart';
import '../responses/base_response/base_response.dart';
import '../responses/order_response/order_response.dart';
import '../responses/user_response/user_response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/NativeApp/login")
  Future<BaseResponse<LoginResponse, LoginRequest>> login(
    @Field("phoneNumber") String phoneNumber,
    @Field("email") String email,
    @Field("password") String password,
  );

  @GET("/NativeApp/getUserDetailForNative")
  Future<BaseResponse<UserResponse, dynamic>> getUserData();

  @POST("/Product/getAllProductForMemberViewNew")
  Future<
      BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
          GetAllProductsFilterReq>> getAllProduct(
    @Field("categoryId") int categoryId,
    @Field("slugName") String slugName,
    @Field("tagId") int tagId,
    @Field("includingSubCategory") bool includingSubCategory,
    @Field("status") List<String> status,
    @Field("pageCount") int pageCount,
    @Field("pageNo") int pageNo,
    @Field("pageSize") int pageSize,
    @Field("search") String search,
    @Field("sortOrder") String sortOrder,
    @Field("sortBy") String sortBy,
    @Field("filterBy") String filterBy,
  );

  @GET("/NativeApp/getCurrentUserShippingAddresses")
  Future<BaseResponse<List<ShippingAddressResponse>, void>> getAllAddresses();

  @POST("/Order/getShippingsForOrder")
  Future<BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>>
      getShippingCharges(
    @Field("weight") double weight,
    @Field("amount") double amount,
    @Field("addressId") int addressId,
  );

  @POST("/DynamicForm/getDynamicFormDataByControlKeys")
  Future<BaseResponse<List<SettingValueResponse>, DynamicFormRequest>>
      getDynamicFormDataByControlKeys(
    @Field("controlKeys") List<String> controlKeys,
  );

  @GET("/Store/getAllStates")
  Future<BaseResponse<List<StatesResponse>, String>> getAllStates(
    @Query("country") String country,
  );

  @POST("/NativeApp/addUserShippingAddress")
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      addUserShippingAddress(
    @Field("fullName") String fullName,
    @Field("phoneNumber") String phoneNumber,
    @Field("pincode") String pincode,
    @Field("state") String state,
    @Field("addressLineOne") String addressLineOne,
    @Field("addressLineTwo") String addressLineTwo,
    @Field("typeOfAddress") String typeOfAddress,
    @Field("isDefault") bool isDefault,
    @Field("userId") int userId,
  );

  @GET("/NativeApp/markAsDefaultAddress/{id}")
  Future<BaseResponse<String, String>> markAsDefaultAddress(
      @Path("id") String id);

  @GET("/Payment/getAllPaymentMethod")
  Future<BaseResponse<List<PaymentMethodResponse>, String>>
      getAllPaymentMethods(
    @Query("area") String area,
  );

  @POST("/Order/createMyOrder")
  Future<BaseResponse<CreateMyOrderResponse, CreateMyOrder>> createMyOrderApi(
      @Body() CreateMyOrder request);

  @GET("/Order/getMyOrderById/{id}")
  Future<BaseResponse<ViewOrderResponse, String>> getOrderById(
      @Path("id") String id);

  @POST("/Order/CancelOrderAndRefundByMember")
  Future<BaseResponse<bool, CancelMyOrder>> cancelMyOrder(
      @Body() CancelMyOrder request);

  @GET("/Payment/getAllTransactionByOrderId")
  Future<BaseResponse<List<TransactionByOrderIdResponse>, String>>
      getTransactionByOrderId(
    @Query("orderId") String orderId,
  );
  @GET("/Shipment/getShipmentById")
  Future<BaseResponse<ShipmentModelResponse, String>> getShipmentById(
    @Query("id") String orderId,
  );

  @POST("/Order/getAllMyOrders")
  Future<
      BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
          BaseFilterRequest>> getAllMyOrders(@Body() BaseFilterRequest request);

  @POST("/Feedback/createFeedback")
  Future<BaseResponse<FeedbackModelResponse, FeedbackModelResponse>>
      createFeedBack(@Body() FeedbackModelResponse request);

  @POST("/NativeApp/updateUserProfile")
  Future<BaseResponse<UserResponse, UserResponse>> updateUserProfile(
      @Body() UserResponse request);

  @POST("/NativeApp/deleteUserShippingAddress")
  Future<BaseResponse<String, DeleteUserShippingAddress>> deleteShippingAddress(
      @Body() DeleteUserShippingAddress request);

  @POST("/NativeApp/addUserShippingAddress")
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      updateUserShippingAddress(
    @Query("addressId") String addressid,
    @Field("id") int id,
    @Field("fullName") String fullName,
    @Field("phoneNumber") String phoneNumber,
    @Field("pincode") String pincode,
    @Field("state") String state,
    @Field("addressLineOne") String addressLineOne,
    @Field("addressLineTwo") String addressLineTwo,
    @Field("typeOfAddress") String typeOfAddress,
    @Field("isDefault") bool isDefault,
    @Field("userId") int userId,
  );

  @POST("/NativeApp/loginWithQrCode")
  Future<BaseResponse<LoginResponse, String>> loginWithQrCode(
      @Field("qrCode") String token);
}
