
import 'package:bloc/bloc.dart';
import 'package:first_flutter_proj/modules/shop_app/login/cubit/states.dart';
import 'package:first_flutter_proj/shared/network/end_points.dart';
import 'package:first_flutter_proj/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>
{
  // b3ml super de 34an cubit nfso 3ndo cinstructor f lazm astd3eh ab3tlo haga
   ShopLoginCubit():super(ShopLoginIntialState());

   static ShopLoginCubit get(context)=>BlocProvider.of(context);

   void userLogin({
      required String email,
      required String password,
})
   {
     emit(ShopLoginLoadingState());
      DioHelper.postData(
          url: LOGIN,
          data: { // Data bb3tha f Body postman
             'email':email,
             'password':password,
          }
      ).then((value) {
         print(value!.data);
         emit(ShopLoginSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(ShopLoginErrorState(error.toString()));
      });

   }

   IconData suffix=Icons.visibility_outlined;
   bool isPassword=true;

   void changePasswordVisibility()
   {
     isPassword=!isPassword;
     suffix=isPassword? Icons.visibility_outlined : Icons.visibility_off;

     emit(ShopChangePasswordVisibilityState());
   }

}