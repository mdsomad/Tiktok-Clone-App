import 'package:cloud_firestore/cloud_firestore.dart';

class myUserModel {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUserModel({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.uid,
  });


  //* jasa koi app sa data Firebase
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePic": profilePhoto,
        "email": email,
        "uid": uid,
      };




  //* Firebase App user ka liya
  static myUserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUserModel(
      email: snapshot['email'],
      profilePhoto: snapshot["profilepic"],
      uid: snapshot["uid"],
      name: snapshot["name"],
    );
  }



}
