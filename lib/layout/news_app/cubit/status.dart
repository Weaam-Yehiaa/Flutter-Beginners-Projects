abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class NewsBottomNavStates extends NewsStates{}

class NewsBusinessLoadingState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsSportsLoadingState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsScienceLoadingState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsSearchLoadingState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}
