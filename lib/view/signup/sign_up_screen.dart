 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';
import 'package:tech_media/viiew_model/signup/signup_controller.dart';

import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:ChangeNotifierProvider(
            create: (_)=>SignUpController(),
            child: Consumer<SignUpController>(
              builder: (context,Provider, child){
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * .01,),
                      Text("Welcome to App", style: Theme
                          .of(context)
                          .textTheme
                          .headline3,),
                      SizedBox(height: height * .01,),
                      Text("Enter your email address \n to register your account",
                        textAlign: TextAlign.center,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1,),
                      SizedBox(height: height * .01,),
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * .06,bottom: height*0.01),
                          child: Column(
                            children: [
                              InputTextField(
                                myController: userNameController,
                                focusNode: usernameFocusNode,
                                onFiledSubmittedValue: (value) {

                                },

                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Username',
                                onValidator: (value) {
                                  return value.isEmpty ? 'enter username' : null;
                                },),
                              SizedBox(height: height * 0.01,),
                              InputTextField(
                                myController: emailController,
                                focusNode: emailFocusNode,
                                onFiledSubmittedValue: (value) {
                                  Utils.filedFocues(context, emailFocusNode,passwordFocusNode);
                                },

                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Email',
                                onValidator: (value) {
                                  return value.isEmpty ? 'enter email' : null;
                                },),
                              SizedBox(height: height * 0.01,),
                              InputTextField(

                                  myController: passwordController,
                                  focusNode: passwordFocusNode,

                                  onFiledSubmittedValue: (value) {

                                  },

                                  keyBoardType: TextInputType.emailAddress,
                                  obscureText: true,
                                  hint: 'password',
                                  onValidator: (value) {
                                    return value.isEmpty ? 'enter password' : null;
                                  }),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 40,),

                      RoundButton(title: 'Sign UP',
                       // loading:false,
                        loading: Provider.loading,
                        onPressed: () {
                        print('tap');
                          if(_formkey.currentState!.validate()){
                          Provider.signup(context,userNameController.text, emailController.text, passwordController.text);
                          }
                        },),
                      SizedBox(height: height * 0.01,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,RouteName.loginView);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account?",
                            children: [
                              TextSpan(
                                text:"login",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                    fontSize: 15, decoration: TextDecoration.underline),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

