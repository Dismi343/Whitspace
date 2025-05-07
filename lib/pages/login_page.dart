import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/pages/rest_password.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  String _email='';
  String _password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Form(
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'University Email',
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        _email=value;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "please enter your emal";
                        }
                        else if(!value.contains('@')){
                          return "please enter valide email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                       TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon:Icon(
                            _obscureText? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      ),
                      obscureText: _obscureText,
                      onChanged: (value){
                        _password=value;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "please enter your password";
                        }
                        else if(value.length < 6){
                          return "password must be at least 6 characters";
                        }
                        return null;
                      },
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
                    onPressed: (){
                      if(_formKey.currentState?.validate() ?? true){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content : Text("Processing..."),
                        )
                        );
                      }
                    },
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