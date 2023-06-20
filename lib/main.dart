import 'package:bloc/bloc.dart';
import 'package:first_flutter_proj/OCR/home_page_ocr.dart';
import 'package:first_flutter_proj/layout/news_app/cubit/cubit.dart';
import 'package:first_flutter_proj/layout/news_app/news_layout.dart';
import 'package:first_flutter_proj/layout/todo_layout/todo_layout.dart';
import 'package:first_flutter_proj/modules/shop_app/login/shop_login_screen.dart';

import 'package:first_flutter_proj/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_flutter_proj/shared/bloc_observer.dart';
import 'package:first_flutter_proj/shared/components/cubit/cubit.dart';
import 'package:first_flutter_proj/shared/components/cubit/states.dart';
import 'package:first_flutter_proj/shared/network/local/cache_helper.dart';

import 'package:first_flutter_proj/shared/network/remote/dio_helper.dart';
import 'package:first_flutter_proj/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main()async {
  // bma en main async de methode mohma gdn btdmnly en ai haga gwaha bt-wait t5ls w b3dha y-run
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init(); // lazm wait leha f 34an kda lazm main tb2a async

  bool? isDark=CacheHelper.getBoolean(key: 'isDark');

  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget
{
  final bool isDark;
  MyApp(this.isDark);


  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getScience()..getSports()),
      BlocProvider(create:(BuildContext context)=>AppCubit()..changeAppMode(
  fromShared: isDark,
  ),)
      ],



        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
           return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

              home:Directionality(
                  textDirection: TextDirection.rtl,
                  child: OnBoardingScreen()
              ),
            );
          },
        ),

    );
  }




}
