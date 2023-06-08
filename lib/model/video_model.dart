import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class VideoModel {
 String username;
  String uid;
  String id;
  List like;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;


  VideoModel({
    required this.username,
    required this.uid,
    required this.id,
    required this.like,
    required this.commentsCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePic,
  });


Map<String,dynamic>toJson()=>{
  'username':username,
  'uid':uid,
  'id':id,
  'like':like,
  'commentsCount':commentsCount,
  'shareCount':shareCount,
  'songName':songName,
  'caption':caption,
  'videoUrl':videoUrl,
  'thumbnail':thumbnail,
  'profilePic':profilePic

};


static VideoModel formSnap(DocumentSnapshot snap){
  var sst = snap.data() as Map<String,dynamic>;
  return VideoModel(
    username: sst['username'],
    uid: sst['uid'],
    id: sst['id'],
    like: sst['like'],
    commentsCount: sst['commentsCount'],
    shareCount: sst['shareCount'], 
    songName: sst['songName'], 
    caption: sst['caption'], 
    videoUrl: sst['videoUrl'], 
    thumbnail: sst['thumbnail'],
    profilePic: sst['profilePic']);
  
  
}






}
