import 'package:first_flutter_proj/modules/shop_app/login/shop_login_screen.dart';
import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:first_flutter_proj/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  late final String image;
  late final String tittle;
  late final String body;

  BoardingModel({
    required this.image,
    required this.tittle,
    required this.body,
});


}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 // const OnBoardingScreen({Key? key}) : super(key: key);
  List<BoardingModel>boarding=
  [
    BoardingModel(
        image: 'assets/images/onboeard_1.png' ,
        tittle:'Title 1 ' ,
        body: 'Body 1 ',
    ),
    BoardingModel(
      image: 'assets/images/onboeard_1.png' ,
      tittle:'Title 2 ' ,
      body: 'Body 2 ',
    ),
    BoardingModel(
      image: 'assets/images/onboeard_1.png' ,
      tittle:'Title 3 ' ,
      body: 'Body 3 ',
    ),

  ];

  bool isLast=false;
  var boardController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(function: (){
              navigateAndFinish(
                context,
                ShopLoginScreen(),
              );
          },
              text:
                'SKIP',
              ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [

            Expanded(
              child: PageView.builder(
                   physics: BouncingScrollPhysics(),
                   controller: boardController,
                   onPageChanged: (int index){
                     if(index==boarding.length-1)
                       {

                         setState(() {
                           isLast=true;
                         });
                       }
                     else {
                       setState(() {
                         isLast=false;

                       });
                     }
                   },
                   itemBuilder: (context,index) =>buildBoardingItem(boarding[index]),
                   itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor:4,
                    activeDotColor: defaultColor,
                  ),
                  count: boarding.length,


                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLast)
                        {
                          navigateAndFinish(context, ShopLoginScreen());
                        }
                      else{
                        boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn
                        );
                      }

                    },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),

                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.tittle}',
        style: TextStyle(
          fontSize: 24.0,

        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 20.0,


        ),
      ),
    ],
  );
}
