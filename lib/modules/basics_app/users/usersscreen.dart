import 'package:first_flutter_proj/models/user_model.dart';
import 'package:flutter/material.dart';



class UserScreen extends StatelessWidget {

  List<UserModel>users =[
    UserModel(
      id: 1,
      name: 'Mazen Yehia',
      phone: '01123553213',
    ),
    UserModel(
      id: 2,
      name: 'Weaam Yehia',
      phone: '01010201808',
    ),
    UserModel(
      id: 3,
      name: 'Raneem Yehia',
      phone: '011235556213',
    ),
    UserModel(
      id: 4,
      name: 'Mohames Yehia',
      phone: '011253213',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Yehia',
      phone: '01123553213',
    ),
    UserModel(
      id: 2,
      name: 'Weaam Yehia',
      phone: '01010201808',
    ),
    UserModel(
      id: 3,
      name: 'Raneem Yehia',
      phone: '011235556213',
    ),
    UserModel(
      id: 4,
      name: 'Mohames Yehia',
      phone: '011253213',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Yehia',
      phone: '01123553213',
    ),
    UserModel(
      id: 2,
      name: 'Weaam Yehia',
      phone: '01010201808',
    ),
    UserModel(
      id: 3,
      name: 'Raneem Yehia',
      phone: '011235556213',
    ),
    UserModel(
      id: 4,
      name: 'Mohames Yehia',
      phone: '011253213',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Yehia',
      phone: '01123553213',
    ),
    UserModel(
      id: 2,
      name: 'Weaam Yehia',
      phone: '01010201808',
    ),
    UserModel(
      id: 3,
      name: 'Raneem Yehia',
      phone: '011235556213',
    ),
    UserModel(
      id: 4,
      name: 'Mohames Yehia',
      phone: '011253213',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Yehia',
      phone: '01123553213',
    ),
    UserModel(
      id: 2,
      name: 'Weaam Yehia',
      phone: '01010201808',
    ),
    UserModel(
      id: 3,
      name: 'Raneem Yehia',
      phone: '011235556213',
    ),
    UserModel(
      id: 4,
      name: 'Mohames Yehia',
      phone: '011253213',
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title:
        Text(
          'Users',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => buildUsersScreen(users[index]),
          separatorBuilder: (context,item) =>Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20.0
            ),
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          itemCount: users.length
      ),
    );
  }

  Widget buildUsersScreen(UserModel user) =>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.purpleAccent,
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' ${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${user.phone}',
            ),
          ],
        ),
      ],
    ),
  );
}
