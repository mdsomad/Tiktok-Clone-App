import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';





class AddCaption_Screen extends StatefulWidget {
  File videoFile;
  String videoPath;
  
   AddCaption_Screen({super.key,required this.videoFile,required this.videoPath});

  @override
  State<AddCaption_Screen> createState() => _AddCaption_ScreenState();
}

class _AddCaption_ScreenState extends State<AddCaption_Screen> {
  
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameControlle = new TextEditingController();
  TextEditingController captionControlle = new TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  
  
  
  
  
  
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);   
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7); 
  }







  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(                                                 //* <-- This video display & Play code
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4 ,
                child: VideoPlayer(videoPlayerController ),
              ),
      
      
         Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
      
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
      
                    TextInputField(
                      controller: songNameControlle,
                       myIcon: Icons.music_note, 
                       myLabelText: "Song Name"
                       ),
      
                 const SizedBox(
                        height: 20,
                       ),
      
      
                    TextInputField(
                      controller: captionControlle,
                       myIcon: Icons.closed_caption, 
                       myLabelText: "Caption"
                       ),
      
                 const SizedBox(height: 10,),
      
      
                    ElevatedButton(onPressed: (){   
      
                  //  VideoUploadController.instance.uploadVideo(songNameControlle.text,captionControlle.text,widget.videoPath);   // <-- This VideoUploadController calss ka Method name --> uploadVideo() Call
                      
                    }, child: Text('Upload',),
                       style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    )
      
      
                  ], 
                ),
              )
      
      
           
            
          ],
        ),
      ),
      
      
      
    );
  }
}