import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 27.0,
              backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/293331182_3315896791975339_4708808255231276779_n.jpg?stp=cp6_dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHLgoxxnf2Dkmn3HXmiI9al2SgUhWSBacHZKBSFZIFpwfDDB7mtO8HaE8msvBxQ1crTcBX-iGnYBUQVZhM01qhl&_nc_ohc=ze1YoufbSsIAX8J8MBo&tn=R8pmmOrG-mN_7G-d&_nc_ht=scontent.faly1-2.fna&oh=00_AfAbv8poXPGhpPrykbSCIC2BpUWQ3-ROhk5-ZL0y0jkf2A&oe=63A06AAE'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.purpleAccent,
              child: Icon(
                Icons.camera_alt,
                size: 23.0,
                color: Colors.white,
              ),
            ),),
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.purpleAccent,
              child: Icon(
                Icons.edit,
                size: 23.0,
                color: Colors.white,
              ),
            ),),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                        'Search'
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 120.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,item){
                    return buildStoryItem();
                  },
                  separatorBuilder:(context,item) =>SizedBox(width: 7.0,) ,
                  itemCount: 15,

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index) => buildChatItem(),
                  separatorBuilder: (context,item) => SizedBox(height: 7.0,) ,
                  itemCount: 20),



            ],
          ),
        ),
      ),
    );
  }
  // build item
  // build list
  // add item to list
  Widget buildChatItem() =>   Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/293331182_3315896791975339_4708808255231276779_n.jpg?stp=cp6_dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHLgoxxnf2Dkmn3HXmiI9al2SgUhWSBacHZKBSFZIFpwfDDB7mtO8HaE8msvBxQ1crTcBX-iGnYBUQVZhM01qhl&_nc_ohc=ze1YoufbSsIAX8J8MBo&tn=R8pmmOrG-mN_7G-d&_nc_ht=scontent.faly1-2.fna&oh=00_AfAbv8poXPGhpPrykbSCIC2BpUWQ3-ROhk5-ZL0y0jkf2A&oe=63A06AAE'),
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text(
              'Weaam Yehia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Hi it\'s my Messageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                    '06.30 AM'
                ),
              ],
            )

          ],

        ),
      ),
    ],
  );
  Widget buildStoryItem() =>  Container(
    width: 70.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/293331182_3315896791975339_4708808255231276779_n.jpg?stp=cp6_dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHLgoxxnf2Dkmn3HXmiI9al2SgUhWSBacHZKBSFZIFpwfDDB7mtO8HaE8msvBxQ1crTcBX-iGnYBUQVZhM01qhl&_nc_ohc=ze1YoufbSsIAX8J8MBo&tn=R8pmmOrG-mN_7G-d&_nc_ht=scontent.faly1-2.fna&oh=00_AfAbv8poXPGhpPrykbSCIC2BpUWQ3-ROhk5-ZL0y0jkf2A&oe=63A06AAE'),
            ),
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Weaam Yehiaaaaaaa',
          maxLines: 2,
          overflow: TextOverflow.ellipsis ,
        ),
      ],
    ),
  );
}
