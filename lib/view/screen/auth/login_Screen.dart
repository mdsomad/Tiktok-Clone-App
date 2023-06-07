import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widgets/glitch.dart';
import '../../widgets/text_input.dart';




class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        //* const - Constant - Value - String , Int  - Fix Rahega  - Use Karna
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            GlithEffect(
                child: const Text(
              "TikTok Clone",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )),

          //!  const SizedBox(
          //!     height: 25,
          // !  ),

          25.ph,

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                myLabelText: "Email",
                myIcon: Icons.email,
              ),
            ),

          // ! const SizedBox(
          // !    height: 20,
          //!   ),

            20.ph,


            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                myLabelText: "Password",
                myIcon: Icons.lock,
                toHide: true,
              ),
            ),

            20.ph,


            ElevatedButton(
                onPressed: () {
                  debugPrint("Login Button Clicked");
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text("Login")
                )
             )




          ],
        ),
      ),
    );
  }
}





//TODO Only One Create SizedBox extension 
extension Padding on num {
  SizedBox get  ph => SizedBox(height: toDouble());
  SizedBox get  pw => SizedBox(width: toDouble());
}