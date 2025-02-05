import 'package:authentication_ui/views/SignUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authcontroller = Get.put(AuthController());

      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Image.asset(
                  "Assets/logo2.png",
                  height: 150, // Increased from 100 to 150
                  width: 150,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                  child: Column(
                    children: [
                      Text(
                        "Sign in your account",
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
                          SizedBox(height: 20,),





                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => authcontroller.Login(),
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ),

                          SizedBox(height: 20),
                          Center(child: Text(
                            "or sign in with",
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
                                  "Don't Have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300
                                  ),

                                ),
                                GestureDetector(
                                  onTap: () => Get.to(() => SignupScreen()),
                                  child: Text(" SIGN UP", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
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
