import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isEmailOkay = true.obs;
  var isPasswordOkay = true.obs;
  var isConfirmPassOkay = true.obs;
  var isTermsAccepted = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  final districtController = TextEditingController();
  final areaController = TextEditingController();

  void toggleTermsAcceptance() {
    isTermsAccepted.value = !isTermsAccepted.value;
  }

  void setDistrict(String district) {
    districtController.text = district;
    Get.back();
  }

  void setArea(String area) {
    areaController.text = area;
    Get.back();
  }


  void Login(){
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    if(email.isEmpty || !email.isEmail){
      isEmailOkay.value = false;
    } else {
      isEmailOkay.value = true;
    }

    if(pass.isEmpty || pass.length < 6){
      isPasswordOkay.value = false;
    } else {
      isPasswordOkay.value = true;
    }

    if(isEmailOkay.value && isPasswordOkay.value && emailController.text == "abc@gmail.com"){
      emailController.clear();
      passController.clear();

      Get.snackbar(
          "Success", "Sign in Successfully!",
        colorText: Colors.white,
        backgroundColor: Colors.green,

      );

    } else {
      Get.snackbar(
        "Error", "Logged in failed!",
        colorText: Colors.white,
        backgroundColor: Colors.red,

      );
    }


  }



  // SIGNUP TO THE SYSTEM WITH VALIDATION
  void SignUp(){
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String pass = passController.text.trim();
    String confPass = confPassController.text.trim();

    if(email.isEmpty || !email.isEmail){
      isEmailOkay.value = false;
    } else {
      isEmailOkay.value = true;
    }

    if(pass.isEmpty || pass.length < 6){
      isPasswordOkay.value = false;
    } else {
      isPasswordOkay.value = true;
    }

    if(confPass != pass) {
      isConfirmPassOkay.value = false;
    } else {
      isConfirmPassOkay.value = true;
    }

    if(!isTermsAccepted.value){
      isTermsAccepted.value = false;
    } else {
      isTermsAccepted.value = true;
    }

    if(isEmailOkay.value && isPasswordOkay.value && isConfirmPassOkay.value && isTermsAccepted.value){
      emailController.clear();
      nameController.clear();
      passController.clear();
      confPassController.clear();



      Get.snackbar(
        "Success", "Sign Up Sucessfully",
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
    }  else {
      Get.snackbar(
        "Error", "Sign Up failed!",
        colorText: Colors.white,
        backgroundColor: Colors.red,

      );
    }


  }

}