import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/model/video_model.dart';


class VideoController extends GetxController{


  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);

  List<VideoModel> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    log('onInit Called');
    _videoList.bindStream(FirebaseFirestore.instance.collection("videos").snapshots().map((QuerySnapshot query){
      List<VideoModel> retVal  = [];
      for(var element in query.docs){
        retVal.add(VideoModel.formSnap(element));
        log('Videos loaded ${element.data()}');
      }
      return retVal;
    }));
  }




 likedVideo(String id) async{
     log('likedVideo Called');
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("videos").doc(id).get();
    var uid = AuthController.instance.user.uid;
    if((doc.data() as dynamic)['like'].contains(uid)){
      await FirebaseFirestore.instance.collection("videos").doc(id).update({
        'like' : FieldValue.arrayRemove([uid]),
      });
       log("Video Likeed");
    }else{
      await FirebaseFirestore.instance.collection("videos").doc(id).update(
          {
            'like' : FieldValue.arrayUnion([uid]),
          });
    }

     log("Video DisLike");
  }








// likedVideo(String id) async{
//   log('likedVideo Called');
//   DocumentSnapshot doc = await FirebaseFirestore.instance.collection('videos').doc(id).get();
//   var uid = AuthController.instance.user.uid;

//   if((doc.data() as dynamic)['likes'].constants(uid)){
    
//     await FirebaseFirestore.instance.collection('videos').doc(id).update({
//       'likes' : FieldValue.arrayRemove([uid]),
//     });
//     log("Video Likeed");
//   }else{
   
//     await FirebaseFirestore.instance.collection('videos').doc(id).update(
//       {
//         'likes' : FieldValue.arrayUnion([uid]),
//       }
//     );

//     log("Video DisLike");
    
    
//   }
// }

  
}







