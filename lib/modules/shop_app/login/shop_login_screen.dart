import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_flutter_proj/modules/shop_app/login/cubit/cubit.dart';
import 'package:first_flutter_proj/modules/shop_app/login/cubit/states.dart';

import 'package:first_flutter_proj/modules/shop_app/register/shop_register_screen.dart';
import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  //const ShopLoginScreen({Key? key}) : super(key: key);
  // ll validation
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var emailControler=TextEditingController();
    var passwordControler=TextEditingController();

    return BlocProvider(

      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginState>(
       listener: (context,state){},
        builder: (context,state){
         return Scaffold(
           appBar: AppBar(),
           body: Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key: formKey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'LOGIN',
                         style: Theme.of(context).textTheme.headline4?.copyWith(
                           color: Colors.black,
                         ),
                       ),
                       Text(
                         'login now to browse our hot ',
                         style: Theme.of(context).textTheme.bodyText1?.copyWith(
                           color:Colors.grey,
                         ),


                       ),
                       SizedBox(
                         height: 30.0,
                       ),
                       defaultFormField(
                         controller: emailControler,
                         type: TextInputType.emailAddress,
                         validate: (String value){
                           if(value.isEmpty)
                           {
                             return 'please enter your email address';
                           }
                         },
                         label: 'Email Address',
                         prefix:Icons.email_outlined ,
                       ),
                       SizedBox(
                         height: 15.0,
                       ),
                       defaultFormField(
                         controller: passwordControler,
                         type: TextInputType.visiblePassword,
                         suffix: ShopLoginCubit.get(context).suffix,
                         onSumbmit: (value){
                           if(formKey.currentState!.validate())
                           {
                             ShopLoginCubit.get(context).userLogin(
                               email: emailControler.text,
                               password: passwordControler.text,
                             );
                           }
                         },
                         isPassword: ShopLoginCubit.get(context).isPassword,
                         suffixPressed: (){
//                           ShopLoginCubit.get(context).changePasswordVisibility();

                         },
                         validate: (String value){
                           if(value.isEmpty)
                           {
                             return 'Password is too short';
                           }
                         },
                         label: 'Password',
                         prefix:Icons.lock_open_outlined ,
                       ),
                       SizedBox(
                         height: 15.0,
                       ),
                       ConditionalBuilder(
                         condition: state is!ShopLoginLoadingState,
                         builder: (context)=>defaultButton(
                           function: (){
                             if(formKey.currentState!.validate())
                               {
                                 ShopLoginCubit.get(context).userLogin(
                                   email: emailControler.text,
                                   password: passwordControler.text,
                                 );
                               }

                           },
                           text: 'login',
                           isUpperCase: true,

                         ),
                         fallback:(context)=> Center(child: CircularProgressIndicator()),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                               'Don\'t have an account? '
                           ),
                           defaultTextButton(function: (){
                             navigateTo(
                               context,
                               ShopRegisterScreen(),
                             );
                           },
                             text:
                             'register',
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ),

         );
        },
      ),
    );
  }
}
