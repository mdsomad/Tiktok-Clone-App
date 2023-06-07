import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';






class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});




 //TODO: Create videoPick Function
  videoPick(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);     
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
    } else {
      Get.snackbar(
          "Error In Selecting Video", "Please Choose A Different Video File");
    }
  }





//TODO: Create showDialogOpt Function
  showDialogOpt(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Container(
                height: MediaQuery.of(context).size.height * .2,
                child: Column(
                  children: [



                    ListTile(
                      onTap: () => videoPick(ImageSource.camera),   //* <-- This videoPick function Call

                      leading: const Icon(
                        Icons.camera,
                        color: Colors.pink,
                      ),
                      title: const Text('Camera'),
                    ),


                    ListTile(
                      onTap: () => videoPick(ImageSource .gallery),   //* <-- This videoPick Function Call
                      title: const Text('Gallery'),
                      leading: const Icon(
                        Icons.photo,
                        color: Colors.pink,
                      ),
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancal")),
                      ],
                    ),



                  ],
                )
              ),


          );
        });
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () =>showDialogOpt(context), //* <-- Call This showDialogOpt Function
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),


      
    );
  }
}
