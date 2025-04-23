enum ProductType { previousOrder, mostLoved, menu }

enum SuggestionTypes { suggestedProducts }

enum SettingValueType {
  string,
  number,
  boolean,
  date,
  Null,
  nan,
  array,
  object,
  undefined
}

enum ProductTypeState {
  PreviouslyOrdered,
  PopularProduct,
  MenuTitle,
  Menu,
  Loading,
  ProductNotFound,
  BannerImages,
  BannerLoader,
  Suggestion,
  AppFooter
}

enum AppSettingsEnum { AppDefaultShippingAppId, AppDefaultOfflinePaymentAppId }

enum StoreProfileEnum {
  StoreName,
  StoreAddressLevel1,
  StoreAddressLevel2,
  StoreAddressLevel3,
  StorePostalcode,
  StoreAddressLevel4
}

enum HelpAndSupportEnum {
  StoreSupportPhoneNumber,
  StoreSupportEmail,
}

enum GeneralOrderSettingEnum {
  canCancelOrder,
  canCancelOrderItems,
}

enum Status { Open, Fulfilled, Cancelled }

bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
}

bool isPhoneNumberValid(String phoneNumber) {
  return RegExp(r"^[0-9]{10}$").hasMatch(phoneNumber);
}

bool isFourDigitsPincode(String pincode) {
  return (RegExp(r'^[0-9]{4}$').hasMatch(pincode));
}

bool isSixDigitsPincode(String pincode) {
  return RegExp(r'^[1-9][0-9]{5}$').hasMatch(pincode);
}
