
import 'package:first_flutter_proj/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //const loginScreen({Key? key}) : super(key: key);
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formkey=GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purpleAccent,
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style:TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500
                    ) ,
                  ),              // LOGIN
                  SizedBox(
                    height: 20.0,
                  ),
                 defaultFormField(
                     controller: emailController,
                     type: TextInputType.emailAddress,
                     validate: (String value){
                       if(value.isEmpty)
                         {
                           return 'email must not be empty';
                         }
                       return null;
                     },
                     label: 'Email',
                     prefix: Icons.email,

                 ),   // Email Address
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'password is too short';
                      }
                      return null;
                    },
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword?Icons.visibility : Icons.visibility_off ,
                    isPassword: isPassword,
                    suffixPressed: (){
                      setState(() {
                        isPassword=!isPassword;
                      });

                    },
                  ),  //Password
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: (){
                      if(formkey.currentState!.validate())
                      {print(emailController.text);
                      print(passwordController.text);}
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account' ),

                      TextButton(onPressed: (){},
                        child: Text(
                          'Register now',
                          style:TextStyle(
                            color: Colors.purpleAccent,
                          ) ,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
