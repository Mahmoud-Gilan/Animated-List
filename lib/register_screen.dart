import 'package:flutter/material.dart';
import 'package:loginscreen/login_screen.dart';
import 'compon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  final FullnameController =TextEditingController();
  final NmumberController =TextEditingController();
  final emailController =TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController= TextEditingController();
  final formKey =GlobalKey<FormState>();
  @override
  void inistate() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Stack(
                  children: [
                    Container(
                  width: 430,
                  height: 250,
                  color: Colors.purple,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: IconButton(onPressed: ( ){
                        Navigator.pop(context);
                      },
                          icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyTextFormField (labelText: 'Full Name', prefixIcon: Icons.person, padding:12, keyboardType: TextInputType.text, Validator: (value){
                if(value!.isEmpty){
                  return 'please enter your Full Name';
                }
              }, controller:FullnameController ),
              MyTextFormField (labelText: 'Phone Number', prefixIcon: Icons.phone, padding:12, keyboardType: TextInputType.phone,  Validator: (value){
                if(value!.isEmpty){
                  return 'please enter your Number';
                }
              }, controller: NmumberController),
              MyTextFormField (labelText: 'Email Address', prefixIcon: Icons.email, padding:12, keyboardType: TextInputType.emailAddress,  Validator: (value){
                if(value!.isEmpty){
                  return 'please enter your email';
                }
                else if (emailController.text.contains('@')== false||emailController.text.contains('.')==false ) {
                  return 'please enter a valid email';
                }

              }, controller: emailController),
              Padding(
                padding: const EdgeInsets.all(12),
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
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: isPassword,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                        return 'please enter Confirm password';
                      }
                      else if (value!=confirmPasswordController.value){
                        return "the password don't matching";
                      };
                      return null;
                    }
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    print(emailController.text);
                    print(passwordController.text);
                    MyNavigator(context: context, widget: const LoginScreen());
                  }

                }, child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(156, 39, 176, 1.00),
                    padding: EdgeInsets.symmetric(
                      horizontal: 125,
                      vertical:15,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
