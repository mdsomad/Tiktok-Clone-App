import 'package:flutter/material.dart';






class ProfileButton extends StatefulWidget {
  String profilePhotoUrl;
  ProfileButton({super.key,required this.profilePhotoUrl});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
              child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image(
                // image: NetworkImage(profilePhotoUrl),
                  image: NetworkImage("https://images.pexels.com/photos/1319911/pexels-photo-1319911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}