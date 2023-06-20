abstract class ShopLoginState{}

class ShopLoginIntialState extends ShopLoginState{}

class ShopLoginLoadingState extends ShopLoginState{}

class ShopLoginScreenState extends ShopLoginState{}

class ShopLoginSuccessState extends ShopLoginState{}

class ShopLoginErrorState extends ShopLoginState
{
  late final String error;

  ShopLoginErrorState(this.error);

}

class ShopChangePasswordVisibilityState extends ShopLoginState{}