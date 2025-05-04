import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whitespace/constants/colors.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          "Reset Password",
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body:SafeArea(
        child :Column(
          children: [
            Expanded(child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100,right: 25,left: 25),
                    child:TextField(
                      decoration: InputDecoration(
                        labelText:"Enter Your University Email",
                        border:UnderlineInputBorder(
                        )
                      ),
                    )
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 70),
                    child:ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 60),
                                  elevation: 5,
                                  backgroundColor: primaryBlue,
                                ),
                     child:Text(
                      'Send Varification Code',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                     )
                    )
                    ),
                    Container(
                    alignment: Alignment.center, // Aligns the whole container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the children inside the Row
                      children: [
                        // First TextField
                        Padding(
                          padding: EdgeInsets.only(left:0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextField(
                              showCursor: false, 
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1),],
                              
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),

                        // Second TextField
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextField(
                              showCursor: false, 
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),

                        // Third TextField
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextField(
                              showCursor: false, 
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),

                        // Fourth TextField
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextField(
                              showCursor: false, 
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                
                ],
              ),
            ))
          ],
        )
      )
    );
  }
}

