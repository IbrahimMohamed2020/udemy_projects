abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoginLodingState extends SocialLoginStates {}

class SocialLoginSuccessState extends SocialLoginStates {
  final String uId;
  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends SocialLoginStates {

  /// علشان نظهر الخطأ على الشاشة
  late final String error;
  SocialLoginErrorState(this.error);

}

class SocialChangePasswordVisibilityState extends SocialLoginStates {}