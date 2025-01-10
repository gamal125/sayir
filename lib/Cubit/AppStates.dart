
abstract class AppStates {}

class AppInitialState extends AppStates {}

class LoginLoadingState extends AppStates {}
class   CreateUserSuccessState extends AppStates {}



class CreateUserErrorState extends AppStates {
  final String error;

  CreateUserErrorState(this.error);
}

class LoginSuccessState extends AppStates {
  final String uId;

  LoginSuccessState(this.uId,);

}

class LoginErrorState extends AppStates {
  final String error;

  LoginErrorState(this.error);
}
class ImageErrorStates extends AppStates {
  final String error;

  ImageErrorStates(this.error);
}

class ChangePasswordState extends AppStates {}
class LogoutLoadingState extends AppStates {}
class ImageintStates extends AppStates {}
class LogoutSuccessState extends AppStates {}
class ImageSuccessStates extends AppStates {}
class GetUserSuccessState extends AppStates {
  final String name;

  GetUserSuccessState(this.name,);
}class UpdateProductImageSuccessStates extends AppStates {}
class UpdateProductImageErrorStates extends AppStates {
  final String error;

  UpdateProductImageErrorStates(this.error,);
}
class CreatePostSuccessState extends AppStates {}
class CreatePostErrorStates extends AppStates {
  final String error;

  CreatePostErrorStates(this.error,);
}
class CreateOrderLoadingState extends AppStates {}
class CreateOrderSuccessState extends AppStates {}
class CreateOrderErrorStates extends AppStates {
  final String error;

  CreateOrderErrorStates(this.error,);
}
class GetServiceLoadingStates extends AppStates {}
class GetServiceSuccessStates extends AppStates {}
class GetServiceStates extends AppStates {
  final String error;

  GetServiceStates(this.error,);
}class GetOrdersLoadingStates extends AppStates {}
class GetOrdersSuccessStates extends AppStates {}
class GetOrdersStates extends AppStates {
  final String error;

  GetOrdersStates(this.error,);
}