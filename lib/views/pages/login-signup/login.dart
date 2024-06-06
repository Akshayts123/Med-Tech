import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/login-signup/signup.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final _formKey = GlobalKey<FormState>();

   // Admin credentials
   final String adminEmail = 'admin@gmail.com';
   final String adminPassword = '123456';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!",  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: spacer -50,),
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {
                    // add your custom validation here.
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'Please enter valid Email';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width:0.5,color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    contentPadding: EdgeInsets.all(0),
                      hintText: "Email",
                     labelText: "Email",
                    errorStyle: TextStyle(color: Colors.red),
                    labelStyle: new TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 13),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                     ),
                ),
              ),

              SizedBox(
                height: spacer -30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {
                    // add your custom validation here.
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value!.length < 6) {
                      return 'Must be more than 6 charater';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  controller: _passwordController,
                  obscureText: true,
                  cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width:0.5 ,color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.grey),
                        ),
                      contentPadding: EdgeInsets.all(0),
                        hintText: "Password",
                        labelText: "Password",
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: new TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.w500),
                      labelStyle: new TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 13),
                      focusColor: Theme.of(context).primaryColor ,
                      hoverColor: Theme.of(context).primaryColor ,
                      prefixIcon: Icon(Icons.lock_outline,color: Theme.of(context).primaryColor,),
                    ),
                ),
              ),
              SizedBox(
                height: spacer ,
              ),

              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Check if the entered credentials are admin credentials
                    if (_emailController.text == adminEmail &&
                        _passwordController.text == adminPassword) {
                      // Navigate to the admin screen
                      Get.to(AdminScreen());
                    } else {
                      // Handle regular user login logic here
                      // For now, navigate to the signup screen as an example
                      Get.to(Signup());
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios,size: 13,color: Theme.of(context).primaryColor,),
              Text("Don’t have an account ?",style:  GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),),
            SizedBox(width: spacer -40,),
            Text( "Sign Up",style:  GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),),
            SizedBox(width: spacer -30,),
          ],
        ),
      ),
    );
  }
}
