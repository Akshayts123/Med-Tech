import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medtech/consts/padding.dart';
import 'package:medtech/views/pages/login-signup/verified_account.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              Text("Create your account",  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: spacer -20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width:0.5,color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Name",
                    labelText: "Your Name",
                    labelStyle: new TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 13),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacer -20,
              ),Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {

                  },
                  style: TextStyle(color: Colors.black),
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width:0.5,color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Phone",
                    labelText: "Phone Number",
                    labelStyle: new TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 13),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacer -20,
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
                height: spacer -20,
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
                    // hintStyle: new TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.w500),
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
                onTap: (){
                  Get.to(VerifiedAccount());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Create Account",
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
            Text("Already have account ? ",style:  GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500),),
            SizedBox(width: spacer -40,),
            Text( "Login",style:  GoogleFonts.poppins(
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
