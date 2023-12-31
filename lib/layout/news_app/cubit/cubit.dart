
import 'package:bloc/bloc.dart';
import 'package:first_flutter_proj/layout/news_app/cubit/status.dart';
import 'package:first_flutter_proj/modules/news_app/business/business_screen.dart';
import 'package:first_flutter_proj/modules/news_app/science/science_screen.dart';
import 'package:first_flutter_proj/modules/news_app/sports/sports_screen.dart';

import 'package:first_flutter_proj/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialStates());
  
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(icon: Icon(
      Icons.business
    ),
      label: 'Business'
    ),
    BottomNavigationBarItem(icon: Icon(
        Icons.sports
    ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(icon: Icon(
        Icons.science
    ),
        label: 'Science'
    ),



  ];

  List<Widget>screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    if(index==1)
      getSports();
    if(index==0)
    getBusiness();
    if(index==2)
    getScience();
    emit(NewsBottomNavStates());
  }
  
  List<dynamic>business=[];
  
  void getBusiness(){

    emit(NewsBusinessLoadingState());


        DioHelper.getData(
          url: '/v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'fe6588b4a34f485d92c1e8bed3a5b687',

          },
        ).then((value)
        {
          business=value?.data['articles'];
          print(business.length);
          print(business[0]['title']);

          emit(NewsGetBusinessSuccessState());
        }).catchError((error){
          print(error.toString());

          emit(NewsGetBusinessErrorState(error.toString()));
        });



  }

  List<dynamic>sports=[];

  void getSports(){
    emit(NewsSportsLoadingState());
    if(sports.length==0)
      {
        DioHelper.getData(
          url: '/v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'fe6588b4a34f485d92c1e8bed3a5b687',

          },
        ).then((value)
        {
          sports=value?.data['articles'];
          print(sports.length);
          print(sports[0]['title']);

          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());

          emit(NewsGetSportsErrorState(error.toString()));
        });
      }
    else{
      emit(NewsGetSportsSuccessState());
    }


  }

  List<dynamic>science=[];

  void getScience(){
    emit(NewsScienceLoadingState());
    if(science.length==0)
      {
        DioHelper.getData(
          url: '/v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'fe6588b4a34f485d92c1e8bed3a5b687',

          },
        ).then((value)
        {
          science=value?.data['articles'];
          print(science.length);
          print(science[0]['title']);

          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());

          emit(NewsGetScienceErrorState(error.toString()));
        });
      }
    else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic>search=[];

  void getSearch(String value){
    emit(NewsScienceLoadingState());

    DioHelper.getData(
      url: '/v2/everything',
      query: {
        'q':'value',
        'apiKey':'fe6588b4a34f485d92c1e8bed3a5b687',

      },
    ).then((value)
    {
      search=value?.data['articles'];
      print(search.length);
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}