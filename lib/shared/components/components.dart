import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_flutter_proj/shared/components/cubit/cubit.dart';
import 'package:first_flutter_proj/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function()? function,
  required String text,

}) =>   Container(
  width: width,

  height: 40.0,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() : text ,
      style: TextStyle(
          color: Colors.white
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);

Widget defaultTextButton({
  required Function()? function,
  required String text,
})=>TextButton(
  onPressed: function,
  child: Text(text.toUpperCase()),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword=false,
  Function? onSumbmit,
  Function? onChanged,
  VoidCallback? onTap,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable=true,

}) => TextFormField(
  controller: controller,
  obscureText: isPassword,
  enabled: isClickable,
  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix!=null ?
    IconButton(
      onPressed:suffixPressed!() ,
      icon: Icon(
        suffix,),

    ):null,

  ),
  keyboardType: type,
  onFieldSubmitted:(value) {
    return onSumbmit!(value);
  } ,
  onChanged:(value) {
    return onChanged!(value);
  } ,
  onTap:onTap,
  validator: (value) {
    return validate!(value);
  },

);
Widget buildTaskItem(Map model,context) =>  Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id']);

  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          backgroundColor: Colors.purpleAccent,
  
          child: Text(
  
            '${model['time']}',
  
            style: TextStyle(
  
                color: Colors.white
  
            ) ,
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text(
  
          '${model['title']}',
  
                style: TextStyle(
  
                  fontSize: 20.0,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
              ),
  
              Text(
  
                '${model['date']}',
  
                style: TextStyle(
  
  
  
                    color: Colors.grey
  
                ),
  
              ),
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateData(status: 'done', id: model['id']);
  
        },
  
            icon: Icon(Icons.check_box,
  
            color: Colors.green,)),
  
        IconButton(onPressed: (){
  
          AppCubit.get(context).updateData(status: 'archive', id: model['id']);
  
        },
  
            icon: Icon(Icons.archive,
  
              color: Colors.black45,
  
  
  
            )),
  
      ],
  
    ),
  
  ),
);

Widget tasksBuilder({
  required List<Map>tasks,
}) => ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context)=> ListView.separated(
      itemBuilder: (context,index)=>buildTaskItem(tasks[index],context)
      , separatorBuilder: (context,index)=> myDivider()
      , itemCount: tasks.length),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 150.0,
          color: Colors.grey,
        ),
        Text(
          'No tasks yet, Please add some tasks',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],

    ),
  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(

    width: double.infinity,

    height: 1.0,

    color: Colors.grey[300],

  ),
);

Widget buildArticleItem(article,context) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
           image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),

        ),
      ),
      SizedBox(
        width: 11.0,
      ),
      Expanded(
        child: Container(
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget articleBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>
      ListView.separated(
        physics: BouncingScrollPhysics(),//bt5leh ynot ama as7b 4a4a l fo2
        itemBuilder: (context,index)=>buildArticleItem(list[index], context),
        separatorBuilder:(context,index)=>myDivider(),
        itemCount: 10,
      ),
  fallback: (context)=>isSearch?Container():Center(child: CircularProgressIndicator()),
);


void navigateTo(context,widget)=>  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>widget,
  ),
);

void navigateAndFinish(context,widget)=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>widget,
        ),
        (route) {
          return false;
        } //3ayza al fat ykon mwgood wla nms7 omo
    );