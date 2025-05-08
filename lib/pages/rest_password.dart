import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whitespace/constants/colors.dart';
import 'package:whitespace/pages/reset_varify.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
   _ResetPageState createState() => _ResetPageState();
  
}
class _ResetPageState extends State<ResetPage>{

  final int fieldCount=4;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

@override
void initState(){
  super.initState();
  _controllers = List.generate(fieldCount, (_) => TextEditingController());
  _focusNodes = List.generate(fieldCount, (_) => FocusNode());
}


@override
void dispose(){
  _controllers.forEach((controller) => controller.dispose());
  _focusNodes.forEach((node) => node.dispose());
  super.dispose();
}


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
                      child:Varify()
                    ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 70,horizontal: 25),
                    child:ElevatedButton(
                      onPressed: (){},
                      style:ElevatedButton.styleFrom(
                        minimumSize:Size(300, 60),
                        elevation:5,
                        backgroundColor: primaryYellow
                      ),
                      child:Text(
                        'verify',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    )
                  )

                
                ],
              ),
            ))
          ],
        )
      )
    );
  }
}

