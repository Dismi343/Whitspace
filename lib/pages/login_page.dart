import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/pages/rest_password.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.poppins(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Container(  
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child:Column(
                      children:[
                        const SizedBox(height: 50),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'University Email',
                        hintText: 'Enter your university email',
                        border: UnderlineInputBorder(
                          
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                       TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        border: UnderlineInputBorder(
                         
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 200,top:30),
                      child:TextButton(
                        onPressed: ()=>{
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ResetPage()))
                        },
                       child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          color: fontBlue,
                          decoration: TextDecoration.underline
                          
                        ),
                       ))
                    ),
                    ]
                    )
                    ),
               Container(   
                padding: EdgeInsets.only(top: 20),
                  child:ElevatedButton(
                    onPressed: (){},
                     style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 60),
                                  elevation: 5,
                                  backgroundColor: primaryBlue,
                                ),
                     child:Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                     )
                     )
                     ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Fotter(),
            ),
          ],
        ),
      ),
    );
  }
}