import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent ,
        leading:Icon(
          Icons.menu,
        ),
        title: Text(
            'First App'
        ),
        actions: [
          IconButton(onPressed: onNotification ,
              icon:  Icon(
                  Icons.notification_important
              )),
          Icon(
              Icons.search
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                image: NetworkImage(
                  'https://img.freepik.com/free-vector/hand-painted-watercolor-galaxy-background_52683-63441.jpg?w=2000',

                ),
                width: 800.0,
                height: 700.0,
                fit: BoxFit.cover,

              ),
              Container(
                //width: 200.0,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,

                ),
                child: Text(
                  'Galaxy',
                  style: TextStyle(
                      color: Colors.indigo,
                      backgroundColor: Colors.white.withOpacity(.3),
                      fontSize: 25.0
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  void onNotification(){
    print('Notification is clicked');
  }

}