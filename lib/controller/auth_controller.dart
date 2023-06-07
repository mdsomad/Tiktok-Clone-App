import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/user.dart';




class AuthController extends GetxController {

  static AuthController instance = Get.find(); 

   File? proimg;
  

  pickImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image == null) return;

    final img = File(image.path);
    
    this.proimg = img;


  }

  

  //* User Register

  void SignUp(String username, String email, String password, File? image) async {

    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null) {

       UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

       String downloadURL = await _uploadProPic(image);  //* <-- _uploadProPic function call

        myUserModel userModel = myUserModel(
          name:username,
          email: email,
          profilePhoto: downloadURL,
          uid: credential.user!.uid
        ); 
              //* User Data Upload Firebase Database
        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(userModel.toJson());
        
      }else{
         Get.snackbar("Error Crating Account","Please Enter all the required fields");
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
