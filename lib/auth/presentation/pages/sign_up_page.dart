import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:sec_2_2/auth/presentation/pages/sign_in_page.dart';
import 'package:sec_2_2/auth/presentation/widgets/text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repository/show_error.dart';
import '../../data/repository/supabace.dart';

class Sign_up_Page extends StatefulWidget {
  const Sign_up_Page({super.key});


  @override
  State<Sign_up_Page> createState() => _Sign_up_PageState();
}

class _Sign_up_PageState extends State<Sign_up_Page> {
  var name_controller = TextEditingController();
  var phone_controller = MaskedTextController(mask: "+0(000)000-00-00");
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();
  var enablebutton = false;
  bool check = false;
  bool is_obscure_password = true;
  bool is_obscure_confirmpassword = true;
  void isValid(){
    setState(() {
      enablebutton = name_controller.text.isNotEmpty && phone_controller.text.isNotEmpty && email_controller.text.isNotEmpty &&
      password_controller.text.isNotEmpty && confirm_password_controller.text.isNotEmpty && check;
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
              SizedBox(height: 40,),
              Text('Create an account',
              style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 8,),
              Text('Complete the sign up process to get started',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 30,),
              CustomTextField(label: "Full name", hint: "Ivanov Ivan", controller: name_controller, onChange: (new_Text){isValid();},),
              SizedBox(height: 24,),
              CustomTextField(label: 'Phone Number', hint: "+7(999)999-99-99", controller: phone_controller, onChange: (new_Text){if (new_Text == "+") {setState(() {phone_controller.clear();});}isValid();},),
              SizedBox(height: 24,),
              CustomTextField(label: 'Email Address', hint: "***********@mail.com", controller: email_controller, onChange: (new_Text){isValid();}),
              SizedBox(height: 24,),
              CustomTextField(label: 'Password', hint: "**********", controller: password_controller, onChange: (new_Text){isValid();}, isObscure: is_obscure_password, onTapSuffix: (){is_obscure_password = !is_obscure_password;},),
              SizedBox(height: 24,),
              CustomTextField(label: 'Confirm Password', hint: "**********", controller: confirm_password_controller, onChange: (new_Text){isValid();}, isObscure: is_obscure_confirmpassword, onTapSuffix: (){is_obscure_confirmpassword = !is_obscure_confirmpassword;}),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14,
                    width: 14,
                    child: Checkbox(

                      value: check,
                      onChanged: (bool? value){
                        check = value!;
                        isValid();
                      },
                      side: BorderSide(color: Color.fromARGB(255, 0, 108, 236)),
                      activeColor: Color.fromARGB(255, 5,96, 250),
                    ),
                  ),
                  SizedBox(width: 15,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By ticking this box, you agree to our ',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms and \nconditions and private policy', style: TextStyle(color: Color.fromARGB(255, 235, 188, 46))),]
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
                        signUp(email: email_controller.text,
                            password: password_controller.text,
                            confirm_password: confirm_password_controller.text,
                            full_name: name_controller.text,
                            phone_number: phone_controller.text,
                            onResponse: (AuthResponse response){
                              if (check == true){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                              }},
                            onError: (String e) {showError(context, e);});}: null,
                      child: Text(
                        'Sign up',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                    },
                    child: Text('Sign in',
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
                      Text("or sign in using",
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
