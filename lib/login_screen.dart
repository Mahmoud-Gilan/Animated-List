import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/compon.dart';
import 'package:loginscreen/register_screen.dart';

import 'animated_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  final emailController =TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: 430,
                          height: 250,
                          color: Colors.purple,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      MyTextFormField ( controller:emailController, labelText: 'Email', prefixIcon: Icons.email, padding:18, keyboardType: TextInputType.emailAddress,
                      Validator: (value){
                        if(value!.isEmpty){
                          return 'please enter your email';
                        }
                        else if (emailController.text.contains('@')== false||emailController.text.contains('.')==false ) {
                          return 'please enter a valid email';
                        }  
                        return null;
                      }),
                      Padding(
                           padding: const EdgeInsets.all(18),
                        child: TextFormField(
                        controller: passwordController,
                        obscureText: isPassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                          icon: isPassword
                             ? const Icon(Icons.visibility_off)
                             : const Icon(Icons.visibility),
                        ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                      ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter your password';
                              }
                              else if(value.length<8){
                                return 'password must be at least 8 character  ';
                              }
                            }
                        ),
                       ),
                           SizedBox(
                        height: 90,
                      ),
                           Padding(
                        padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(onPressed: (){
                              if(formKey.currentState!.validate()){
                                debugPrint(emailController.text);
                                debugPrint(passwordController.text);
                                MyNavigator(
                                     context: context , widget: const AnimatedListScreen());
                               }
                               },
                                  child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(156, 39, 176, 1.00),
                            padding: EdgeInsets.symmetric(
                              horizontal: 130,
                              vertical:11,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                           Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: (){
                              MyNavigator(context: context, widget: const RegisterScreen());
                              },
                            style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 118,
                                  vertical: 10,
                                ),
                                side: const BorderSide(
                                  color: Colors.purple,
                                  width: 1,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                )
                            ), child: Text('Register',
                          style: TextStyle(
                            color: Colors.purple,
                          ),),

                          )
                      ),
                    ],
                  ),
                ),
      ),
      ),
    );
  }
}
