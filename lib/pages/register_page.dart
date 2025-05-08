import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/pages/details_page.dart";
import "package:whitespace/services/auth_service.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
 _regFormdState createState() => _regFormdState();

}

 class _regFormdState extends State<RegisterPage> {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obsecureConfirmtext = true;
  bool _isLoading = false;
  
  Future<void> _registerUser() async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    setState((){
      _isLoading = true;  
    });
    try{
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmController.text.trim();
      if(password != confirmPassword ){
        showDialog(context: context,
        builder: ((context)=>AlertDialog(
          title:const Text("Error"),
          content: const Text("please make sure your passwords match"),
          actions:[
            TextButton(onPressed: ()=>Navigator.of(context).pop(), 
            child:const Text("OK"),
            )
          ]
        )
        )
        );
        return;
      }

      await AuthService().registerNewUser(email: email, password: password);
       Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => DetailsPage(),
          ),
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
    }
    finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "University Email",
                            border: UnderlineInputBorder(

                            )
                          ),
                          validator:(value){
                            if(value == null || value.isEmpty){
                              return "please enter your email";
                            }else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                              return "please enter a valid email";
                            }
                            return null;
                          },
                         
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: _passwordController,
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
                         
                          validator:(value){
                            if(value==null || value.isEmpty ){
                              return "please enter your password";
                            }
                            else if(value.length < 6){
                              return "password must be at least 6 characters";
                            }
                            return null;
                          }
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: _confirmController,
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
                        
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "please confirm your password";
                            }
                            if(value != _passwordController.text){
                              return "passwords do not match";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 25),

                        ElevatedButton(
                          onPressed:_registerUser,
                          style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 60),
                                  elevation: 5,
                                  backgroundColor: primaryYellow,
                                ),
                          child: _isLoading? const CircularProgressIndicator():  Text(
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
