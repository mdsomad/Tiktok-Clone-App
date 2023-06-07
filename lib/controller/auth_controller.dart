import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';




class AuthController extends GetxController {

  //* User Register

  void SignUp(String username, String email, String password, File? image) async {

    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null) {

        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        _uploadProPic(image);  //* <-- _uploadProPic function call
        
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error Occurred", e.toString());
    }
    
  }






//* Yeh hai Firebase mein File upload Karne Ka Code
Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDownloadURL = await snapshot.ref.getDownloadURL();
    return imageDownloadURL;
  }



  





}
