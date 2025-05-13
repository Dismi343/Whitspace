import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/pages/home_page.dart";
import "package:whitespace/pages/rest_password.dart";
import "package:whitespace/services/auth_service.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   

  bool _isLoading = false;

  Future<void> _signinUser()async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    setState(() {
      _isLoading = true;  
    });

    try{
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
   
      await AuthService().signinUser(email: email, password: password);

      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:(context) => HomePage(), ));

    }catch(error){
    
        showDialog(context: context,
        builder: ((context)=>AlertDialog(
          title:const Text("Error"),
          content:  Text('Error Signing in $error'),
          actions:[
            TextButton(onPressed: ()=>Navigator.of(context).pop(), 
            child:const Text("OK"),
            )
          ]
        )
        )
        );
    }finally{
      setState((){
        _isLoading = false;
      });
    }
  }

  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Form(
        key:_formKey,
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'University Email',
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                   
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
                        controller: _passwordController,
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
                          Navigator.pushReplacement(context,
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
                    onPressed:_signinUser,
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