import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';





class VideoUploadController extends GetxController{

 static VideoUploadController instance = Get.find();      //* <-- This code Yah class ka Function Ko Access karne ke liya

 var uuid = Uuid();






//TODO: Create _getThumb Function                (Yah function video ka Thumbnail Nikal Ke deta hai)
Future<File> _getThumb(String videoPath) async{
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }



//TODO: Create UploadVideoThumbToStorage Function    (Yah Function Video Thumbnail Ko Upload Karta hai FirebaseStorage Mein)
 Future<String> _uploadVideoThumbToStorage(String id , String videoPath) async{
   Reference reference = FirebaseStorage.instance.ref().child("thumbnail").child(id);
   UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
   TaskSnapshot snapshot = await uploadTask;
   String downloadUrl = await snapshot.ref.getDownloadURL();
   return downloadUrl;
}






 

//* 1: Main Video Upload
//* 2: Video To Storage
//* 3: video Compress
//* 4: Video Thumb Generate
//* 5: Video Thumb To Strorage




//TODO: Create UploadVideo function 
uploadVideo({required String songName, required String caption, required String videoPath})async{

    try {

        log('Video Uploading Started');

       //* Yah Login User ka uid find karta hai
       String uid = FirebaseAuth.instance.currentUser!.uid;
      
      //* User Details Get
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      //* videoID - uuid
      String id = uuid.v1();
      String videoUrl = await  _uploadVideoToStorage(id,videoPath);             //* <-- Call This _uploadVideoToStorage function

      String thumbnail  = await   _uploadVideoThumbToStorage(id , videoPath);   //* <-- Call This _uploadVideoThumbToStorage function
      //* IDHAR SE



    VideoModel videoModel = VideoModel(     //* <-- This Video Model call 
        username: (userDoc.data()! as Map<String,dynamic>)['name'] , 
        uid: uid, 
        id: id, 
        like: [],
        commentsCount: 0,
        shareCount: 0, 
        songName: songName, 
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail, 
        profilePic:(userDoc.data()! as Map<String,dynamic>)['profilePic']
        ); 
      

      await FirebaseFirestore.instance.collection("videos").doc(id).set(videoModel.toJson()).then((value){
      Get.snackbar("Video Uploaded Successfully", "Thank You Sharing Your Content");
      log('Video Uploaded Successfully');
    });
    Get.back();
      
      
      
      
      
    } catch (e) {
        log(e.toString());
       Get.snackbar("Error Uploading Video", e.toString());
    }
    
     
  }







   // TODO: Create UploadVideoToStorage Function                  (Yah Function Video Ko Upload Karta hai FirebaseStorage Mein)          
   Future<String> _uploadVideoToStorage(String videoID , String videoPath) async{

     Reference reference = FirebaseStorage.instance.ref().child("videos").child(videoID);

                                           //* Call VideoCompress Function
     UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
     TaskSnapshot snapshot = await uploadTask;
     String downloadUrl = await snapshot.ref.getDownloadURL();
     return downloadUrl;
     
  }
 
 
  
  //TODO: Create VideoCompress Function        (Yah function video ka quality set Karte Hain)
   _compressVideo(String videoPath) async{
    final compressedVideo = await VideoCompress.compressVideo(videoPath, quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }
 
 
 
 
 

}