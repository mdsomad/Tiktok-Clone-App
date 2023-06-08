import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widgets/AlbumRotator.dart';
import 'package:tiktok_clone/view/widgets/ProfileButton.dart';
import 'package:tiktok_clone/view/widgets/TikTokVideoPlayer.dart';

class DisplayVideo_Screen extends StatefulWidget {
  const DisplayVideo_Screen({super.key});

  @override
  State<DisplayVideo_Screen> createState() => _DisplayVideo_ScreenState();
}

class _DisplayVideo_ScreenState extends State<DisplayVideo_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [

                TikTokVideoPlayer(
                  videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktok-clone-22e50.appspot.com/o/videos%2F9dbe88b0-05c5-11ee-8178-677cd978c346?alt=media&token=838181b9-15f1-44d4-90d0-6d9fcd6bd5fd",
                ),


                Container(
                   margin: EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "@DhruvArne",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),


                      Text(
                        "Awesome Caption",
                      ),



                      Text(
                        "Breathing Alive",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )


                      
                    ],
                  ),
                ),
                
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 400,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileButton(
                          profilePhotoUrl: "ADD",
                        ),


                        
                        Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 45,
                              color: Colors.white,
                            ),



                            Text(
                              "Like",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),



                        Column(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 45,
                              color: Colors.white,
                            ),


                            Text(
                              "Share",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),


                        Column(
                          children: [


                            Icon(
                              Icons.comment,
                              size: 45,
                              color: Colors.white,
                            ),



                            Text(
                              "Comments",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),


                          const SizedBox(
                              height: 20,
                            ),


                            Column(
                              children: [AlbumRotator(profilePicUrl: "ADA")],
                            ),



                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
