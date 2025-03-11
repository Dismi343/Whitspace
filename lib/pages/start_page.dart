import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/pages/login_page.dart";
import "package:whitespace/pages/register_page.dart"; 

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding:const EdgeInsets.only(top:100),
              child:Image.asset("assets/images/Logo.png",width:200,height:200,),
            ),
           
            Container(
              padding:const EdgeInsets.only(bottom:100),
              child:Column(
                children: [
                  Padding( 
                    padding:const EdgeInsets.only(bottom: 25),
                    child:ElevatedButton(
                    onPressed:()=>Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>LoginPage())),
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size(350, 60),
                      elevation: 5,
                      backgroundColor:primaryBlue,
                    ),
                    child:Text("Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    ),
                   ),
                   ),
                   ElevatedButton(
                    onPressed:()=>Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>RegisterPage())),
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size(350, 60),
                      elevation: 5,
                      backgroundColor:primaryYellow,
                    ),
                    child:Text("Register",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    ),
                   ),
                   Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child:Text("Powered by WhiteSpace team", style:TextStyle(color:Colors.grey[600],fontSize: 12,fontFamily: "Poppins"),),
                   ),
                   
                ],
              ),
              
            ),
          ],)
      ),
    );
  }
}