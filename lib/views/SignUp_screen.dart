import 'package:authentication_ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  final AuthController authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      "Assets/back_icon.png",
                    height: 10,
                    width: 17,
                  ),
          
                  Image.asset(
                      "Assets/Logo.png",
                    height: 25,
                    width: 25,
          
                  ),
                ],
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  children: [
                    Text(
                      "Create your account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          
                    SizedBox(height: 30,),
          
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
          
                        // NAME
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          controller: authcontroller.nameController,
                          decoration: InputDecoration(
                            hintText: "ex. jon smith",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,
          
                        ),
          
                        SizedBox(height: 10,),
          
                        // Email
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Obx (() => TextField(
                          controller: authcontroller.emailController,
                          decoration: InputDecoration(
                              hintText: "ex. jonsmith@email.com",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
          
                              errorText: authcontroller.isEmailOkay.value
                                  ? null : "Enter a valid email!",
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,
          
                        )),
          
                        SizedBox(height: 10,),
                        // Password
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5,),
          
                        Obx (() => TextField(
                          controller: authcontroller.passController,
                          decoration: InputDecoration(
                              hintText: "*********",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                              errorText: authcontroller.isPasswordOkay.value
                                  ? null : "Password must be at least 6 characters!",
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              )
                          ),
                          obscureText: true,
          
                        )),
                        SizedBox(height: 10,),
          
          
                        // ConfirmPassword
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5,),
          
                        Obx (() => TextField(
                          controller: authcontroller.confPassController,
                          decoration: InputDecoration(
                              hintText: "*********",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                              errorText: authcontroller.isConfirmPassOkay.value
                                  ? null : "Password do not match!",
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              )
                          ),
                          obscureText: true,
          
                        )),
          
                        // Terms and Conditions
                        Row(
                          children: [
                            Obx(() => Checkbox(
                              value: authcontroller.isTermsAccepted.value,
                              onChanged: (value) => authcontroller.toggleTermsAcceptance(),
                            )),
                            Text(
                                "I understood the ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              )
                            ),
                            Text(
                              "terms & policy.",
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
          
                        SizedBox(height: 10,),
          
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () => authcontroller.SignUp(),
                            child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
          
                        SizedBox(height: 20),
                        Center(child: Text(
                            "or sign up with",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                        SizedBox(height: 10),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton("Assets/google.png"),
                            SizedBox(width: 15),
                            _buildSocialButton("Assets/facebook.png"),
                            SizedBox(width: 15),
                            _buildSocialButton("Assets/twitter.png"),
                          ],
                        ),


                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),

                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed("/signin"),
                                child: Text(" SIGN IN", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
          
                      ],
                    ),
          
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      height: 50,
      width: 80,
      color: Colors.grey.shade200,
      child: GestureDetector(
        onTap: () => Get.snackbar("Info", "Social login clicked"),
        child: Image.asset(assetPath, width: 40, height: 40),
      ),
    );
  }


}
