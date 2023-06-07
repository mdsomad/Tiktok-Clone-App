import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/user.dart';
import 'package:tiktok_clone/view/screen/auth/login_Screen.dart';
import 'package:tiktok_clone/view/screen/home_screen.dart';




class AuthController extends GetxController {
  

//* Bina object is class ka functions kisi bhi class mein access Kiya Ja sakta hai Iske through
static AuthController instance = Get.find(); 




File? proimg;
  


//TODO: Create pickImage Function
pickImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image == null) return;

    final img = File(image.path);
    
    this.proimg = img;


  }

  


//* User State Persistence

late Rx<User?> _user;
User get user => _user.value!;

  //* Example
  //* _user  - Nadi
  //* _user.bindStream - Nadi Me Color Deko
  //* ever - Aap Ho

@override
  void onReady() {              //* onReady <-- Yah initState Jaisa Hi Kaam karta hai
    // TODO: implement onReady
    super.onReady();
   _user = Rx<User?>(FirebaseAuth.instance.currentUser);
   _user.bindStream(FirebaseAuth.instance.authStateChanges());  
    ever(_user, _setInitialView);  //* <-- Call this _setInitialView function
   //* Rx - Observable Keyword - Continously Checking Variable Is Changing Or Not.
  }



//TODO: Create _setInitialView Function
_setInitialView(User? user){
    if(user == null){
      Get.offAll(()=> LoginScreen());
    }else{
      Get.offAll(() => HomeScreen());
    }
  }





  //* User Register
  //TODO Create SignUp Function
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
        Get.snackbar("Create", "Successfully");
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





 //TODO Create Login Function
void login(String email, String password)async{
      
      try {
        if(email.isNotEmpty && password.isNotEmpty){
          await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password:password).then((value) {
          Get.snackbar("Login", "Successfully");
        });
        }else{
          Get.snackbar("Error Logging In", "please enter the all fields");
       }
      } catch (e) {
        Get.snackbar('Error logging In', e.toString());
      }
    
    
     
  
  }



  





}
