import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whitespace/constants/colors.dart';
import 'package:whitespace/services/auth_service.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
   _ResetPageState createState() => _ResetPageState();
  
}
class _ResetPageState extends State<ResetPage>{


final TextEditingController _emailController = TextEditingController();
final _formkey = GlobalKey<FormState>();
bool _isLoading = false;

  final int fieldCount=4;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  Future<void> _sendEmail() async{
    if(!_formkey.currentState!.validate()){
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try{

      final email = _emailController.text.trim();
      await AuthService().resetPassword(email: email);

      showDialog(context: context,
        builder: ((context)=>AlertDialog(
          title:const Text("Done"),
          content:  Text('Email sent '),
          actions:[
            TextButton(onPressed: ()=>Navigator.of(context).pop(), 
            child:const Text("OK"),
            )
          ]
        )
        )
        );
    }catch(error){
      showDialog(context: context,
        builder: ((context)=>AlertDialog(
          title:const Text("Error"),
          content:  Text('Error $error'),
          actions:[
            TextButton(onPressed: ()=>Navigator.of(context).pop(), 
            child:const Text("OK"),
            )
          ]
        )
        )
        );
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

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
        child :Center(
          child: Column(
            children: [
              Expanded(child:SingleChildScrollView(
                child: Form(
                  key:_formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:250,left:25,right:25, bottom:70),
                        child:TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText:"Enter Your University Email",
                            border:UnderlineInputBorder(
                            )
                          ),
                         validator: (value){
                           if(value == null || value.isEmpty){
                                return "please enter your email";
                              }else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                return "please enter a valid email";
                              }
                              return null;
                            },
                        )
                      ),
                      Container(
                        alignment: Alignment.center,
                       
                        child:Column(  
                        children:[
                          _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: _sendEmail,
                          style: ElevatedButton.styleFrom(
                                      minimumSize: Size(300, 60),
                                      elevation: 5,
                                      backgroundColor: primaryBlue,
                                    ),
                         child:Text(
                          'Send Reset Link',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                         )
                        )
                        ]
                        )
                        ),
                      
                    
                    ],
                  ),
                ),
              ))
            ],
          ),
        )
      )
    );
  }
}

