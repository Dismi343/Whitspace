import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/pages/details_page.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
 _regFormdState createState() => _regFormdState();

}

 class _regFormdState extends State<RegisterPage> {

    final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obsecureConfirmtext = true;
 
  String _password = '';
  String _email = '';
  String _confirm = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "REGISTRATION",
                        style: GoogleFonts.poppins(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                   Container(
                    margin : const EdgeInsets.symmetric(horizontal: 25),
                    child:Column(
                      children: [
                        const SizedBox(height: 50,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "University Email",
                            border: UnderlineInputBorder(

                            )
                          ),
                          onChanged :(value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "password",
                            border: UnderlineInputBorder(),
                            suffixIcon: IconButton(
                              icon:Icon(
                                _obscureText? Icons.visibility: Icons.visibility_off,
                              ),
                              onPressed: (){
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                          onChanged: (value){
                            _password = value;
                          },
                          validator:(value){
                            if(value==null || value.isEmpty ){
                              return "please enter your password";
                            }
                            if(value.length < 6){
                              return "password must be at least 6 characters";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "conrirm password",
                            border: UnderlineInputBorder(),
                            suffixIcon: IconButton(
                              icon:Icon(
                                _obsecureConfirmtext? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: (){
                                setState(() {
                                  _obsecureConfirmtext = !_obsecureConfirmtext;
                                });
                             
                              },
                            ),
                          ),
                          obscureText: _obsecureConfirmtext,
                          onChanged: (value){
                            _confirm=value;
                          },
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "please confirm your password";
                            }
                            if(value != _password){
                              return "passwords do not match";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 25),

                        ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Proccessing....")),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(),
                                ),
                              );
                             
                            }
                          },
                          style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 60),
                                  elevation: 5,
                                  backgroundColor: primaryYellow,
                                ),
                          child: Text(
                            "Sign Up",
                          style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,)
                          )
                        )
                      ],
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
