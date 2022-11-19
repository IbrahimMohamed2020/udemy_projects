abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLodingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {}

class ShopLoginErrorState extends ShopLoginStates {

  /// علشان نظهر الخطأ على الشاشة
  late final String error;
  ShopLoginErrorState(this.error);

}