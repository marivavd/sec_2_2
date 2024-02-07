import 'package:flutter/material.dart';
import 'package:sec_2_2/auth/presentation/pages/sign_up_page.dart';
import 'package:sec_2_2/home/presentation/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repository/show_error.dart';
import '../../data/repository/supabace.dart';
import '../widgets/text_field.dart';

class Sign_in_Page extends StatefulWidget {
  const Sign_in_Page({super.key});

  @override
  State<Sign_in_Page> createState() => _Sign_in_PageState();
}

class _Sign_in_PageState extends State<Sign_in_Page> {
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  bool check = false;
  bool is_obscure_password = true;
  var enablebutton = false;
  void isValid(){
    setState(() {
      enablebutton =  email_controller.text.isNotEmpty && password_controller.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 135,),
              Text('Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 8,),
              Text('Fill in your email and password to continue',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 30,),
              CustomTextField(label: 'Email Address', hint: "***********@mail.com", controller: email_controller, onChange: (new_Text){isValid();}),
              SizedBox(height: 24,),
              CustomTextField(label: 'Password', hint: "**********", controller: password_controller, onChange: (new_Text){isValid();}, isObscure: is_obscure_password, onTapSuffix: (){is_obscure_password = !is_obscure_password;},),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(child:
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (bool? value){
                            setState(() {
                              check = value!;
                            });
                          },
                          side: BorderSide(color: Color.fromARGB(255, 167, 167, 167)),
                        ),
                        Text('Remember password',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  )),
                  SizedBox(
                    child: InkWell(
                      onTap: (){
                      },
                      child: Text('Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 5, 96, 250)
                        ),),
                    ),

                  ),
                ],
              ),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 342,
                  height: 46,
                  child: FilledButton(
                      style: Theme.of(context).filledButtonTheme.style,
                      onPressed: (enablebutton) ? () async{
                        await signIn(email: email_controller.text,
                            password: password_controller.text,
                            onResponse: (AuthResponse response){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));},
                            onError: (String e) {showError(context, e);});}: null,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up_Page()));
                    },
                    child: Text('Sign Up',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("or log in using",
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset("assets/google.png"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}