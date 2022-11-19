abstract class SocialRegisterStates {}


class SocialRegisterInitialState extends SocialRegisterStates {}

class SocialRegisterLodingState extends SocialRegisterStates {}

class SocialRegisterSuccessState extends SocialRegisterStates {}

class SoiclRegisterErrorState extends SocialRegisterStates {
  late final String error;
  SoiclRegisterErrorState(this.error);
}

class SocialCreatUserSuccessState extends SocialRegisterStates {}

class SocialCreatUserErrorState extends SocialRegisterStates {
  late final String error;
  SocialCreatUserErrorState(this.error);
}

class SocialRegisterChangePasswordVisibilityState extends SocialRegisterStates {}