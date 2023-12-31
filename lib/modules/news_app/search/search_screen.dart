import 'package:first_flutter_proj/layout/news_app/cubit/cubit.dart';
import 'package:first_flutter_proj/layout/news_app/cubit/status.dart';
import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var searchController=TextEditingController();

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var list=NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller:searchController
                    , type: TextInputType.text
                    ,onChanged: (value)
                {
                  NewsCubit.get(context).getSearch(value);

                }
                    , validate: (String value)
                {
                  if(value.isEmpty)
                  {
                    return 'Search must not be empty';
                  }
                }

                    , label: 'Search'
                    , prefix: Icons.search
                ),
              ),
              Expanded(
                child:
                articleBuilder(list, context,isSearch: true),
              )

            ],
          ),
        );
      },

    );
  }
}
