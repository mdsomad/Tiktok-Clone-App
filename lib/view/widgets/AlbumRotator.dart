import 'package:flutter/material.dart';







class AlbumRotator extends StatefulWidget {
   String profilePicUrl;
   AlbumRotator({super.key,required this.profilePicUrl});

  @override
  State<AlbumRotator> createState() => _AlbumRotatorState();
}

class _AlbumRotatorState extends State<AlbumRotator> with SingleTickerProviderStateMixin {

  late AnimationController controller;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 5));
    controller.forward();
    controller.repeat();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0,end:1.0).animate(controller),
      child: SizedBox(
        height: 70,
        width: 70,
        child: Column(
          children: [
            Container(
               height: 60,           
               width: 60,
               decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Colors.green,
                    Colors.white,
                    ]),
                    borderRadius: BorderRadius.circular(35),
                ),
                
                
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: 
                  Image(
                    image: 
                    //  NetworkImage(profilePicUrl),
                     NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'),
                     fit: BoxFit.cover,
                     ),
                  ),
              ),
                
          ],
        ),
      ),
    );
  }
}