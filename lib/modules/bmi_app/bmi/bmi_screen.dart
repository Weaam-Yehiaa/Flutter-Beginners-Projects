import 'dart:math';

import 'package:first_flutter_proj/modules/bmi_app/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double height=120.0;
  int weight=50;
  int age=15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'BMI Calculator'
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body:  Container(
        color: Colors.grey[400],
        child: Column(

          children: [
            Expanded(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale ? Colors.purpleAccent: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),

                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/male.png'),
                                height: 200.0,
                                width: 200.0 ,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              )
                            ],
                          )
                          ,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        } ,
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isMale?Colors.purpleAccent: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                height: 220.0,
                                width: 220.0 ,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              )
                            ],
                          )
                          ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize:  30.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                                fontSize:  30.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                                fontSize:  15.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Slider(

                        value: height,
                        max: 220.0,
                        min: 80.0,
                        activeColor: Colors.purpleAccent,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                          print(value.round());
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontSize:  30.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontSize:  30.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  heroTag: 'weight--',
                                  backgroundColor: Colors.purpleAccent,
                                  child: Icon(
                                    Icons.remove,
                                  ) ,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                }, heroTag: 'weight++',
                                  backgroundColor: Colors.purpleAccent,
                                  child: Icon(
                                    Icons.add,
                                  ) ,
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize:  30.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontSize:  30.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  heroTag: 'age--',
                                  backgroundColor: Colors.purpleAccent,
                                  child: Icon(
                                    Icons.remove,
                                  ) ,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  heroTag: 'age++',
                                  backgroundColor: Colors.purpleAccent,
                                  child: Icon(
                                    Icons.add,
                                  ) ,
                                ),
                              ],
                            )
                          ],
                        ),



                      ),
                    ),
                  ],
                ),
              ),


            ),
            Container(
              width: double.infinity,
              color: Colors.purpleAccent,
              height: 70.0,
              child: MaterialButton(onPressed: (){
                var result=weight/pow(height/100,2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>BMIResult(
                      age: age,
                      isMale: isMale,
                      result: result,
                    ),
                  ),
                );
              },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
