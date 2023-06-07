import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/glitch.dart';
import '../../widgets/text_input.dart';




class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _setPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top:120),
          alignment: Alignment.center,
      
          //* const - Constant - Value - String , Int  - Fix Rahega  - Use Karna
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
      
              GlithEffect(
                  child: const Text(
                "Welcome TikTok Clone",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              )),
      
              25.ph,
      
      
                InkWell(
                  onTap: (){
                    AuthController.instance.pickImage();
                    debugPrint("CircleAvatar Clicked");
                  },
                  child: Stack( 
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://st3.depositphotos.com/1767687/16607/v/450/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg'),
                        backgroundColor: Colors.red, radius: 50,),
              
                      Positioned( bottom: 0, right: 0, child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple
                      ),
                        child: Icon(Icons.edit , size: 25,color: Colors.yellowAccent,))
                      )
                    ],
                  ),
                ),
              
              
      
            20.ph,
      


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                ),
              ),
      
      
              20.ph,
      
      
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setPasswordController,
                  myLabelText: "Set Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
      
      
              20.ph,
      
      
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _confirmPasswordController,
                  myLabelText: "Confirm Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
      
              20.ph,
      
             Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernameController,
                  myLabelText: "Username",
                  myIcon: Icons.person,
                ),
              ),
      
              30.ph,
              
              ElevatedButton(
                  onPressed: () {

                    AuthController.instance.SignUp(_usernameController.text.trim().toString(), _emailController.text.trim().toString(), _setPasswordController.text.trim().toString(), AuthController.instance.proimg);
                     
                    debugPrint("SignUp Button Clicked");
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Text("Sign Up")
                  )
               )
      
      
      
      
            ],
          ),
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