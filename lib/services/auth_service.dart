import 'package:firebase_auth/firebase_auth.dart';
import 'package:whitespace/exceptions/auth_exceptions.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
User? getCurrentUser() {
 return _auth.currentUser; 
}

Future<void> singOut() async{
  try{
    await _auth.signOut();
    print("User signed out successfully");
  }on FirebaseAuthException catch (e) {
    print("Error signing out: ${mapFirebaseAuthExceptionCode(e.code)}");
    throw Exception(mapFirebaseAuthExceptionCode( e.code));
    }
  catch(error){
    print('Error signing out: $error');
  }
}

Future<void> registerNewUser({required String email, required String password}) async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    print("Error creating new user: ${mapFirebaseAuthExceptionCode(e.code)}");
    throw Exception(mapFirebaseAuthExceptionCode(e.code));
  }
  catch(e){
    print("error registering user: $e");
  }
}

}
