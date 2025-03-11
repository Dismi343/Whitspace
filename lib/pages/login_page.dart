import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:Column (
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:150,),
                child:Text(
                "LOGIN" ,
                style:GoogleFonts.poppins(  
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  ),
              ),
              ),
              const SizedBox(height: 85),
              Text(
                "with",
                style:GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: (){},
               style:ElevatedButton.styleFrom(
                  elevation: 5, 
                  minimumSize: Size(250, 60),
                  maximumSize: Size(250, 60),
                  backgroundColor: Colors.white,
                  side:BorderSide(
                    color:Color(0xFF043F8D),
                    width: 1,
                  ) 
               ),
               child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/google_icon.png',
                    height: 24, width:24),
                    SizedBox(width: 50),
                    Text(
                      "Google",
                      style:GoogleFonts.poppins(
                        color:Colors.grey[800],
                        fontSize: 16,
                      )
                      ),
                ],
               ),
                ),

                
            ],
          ),
          Fotter()
          
          ],
      ),
    ),
    );
  }
}