import 'package:firebase_auth/firebase_auth.dart';
import 'package:whitespace/exceptions/auth_exceptions.dart';
import 'package:whitespace/models/UserModel.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
User? getCurrentUser() {
 return _auth.currentUser; 
}

//create a user from firebase user
UserModel? _userFromFirebaseUser(User? user) {
  return user != null ? UserModel(uid: user.uid) : null;
}
//create the stream for checking the auth changes in the user
Stream<UserModel?> get user {
  return _auth.authStateChanges().map(_userFromFirebaseUser);
}

Future<void> signOut() async{
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


Future<void> signinUser({required String email, required String password}) async{
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
     print("Error sign in : ${mapFirebaseAuthExceptionCode(e.code)}");
    throw Exception(mapFirebaseAuthExceptionCode(e.code));
  }
  
  catch(error){
    print('error signing in: $error');
  }
}

Future<void> resetPassword({required String email}) async{
  try{

    await _auth.sendPasswordResetEmail(email: email);
    print('Sent: $email');
  }on FirebaseAuthException catch(e){
    print("Error creating new user: ${mapFirebaseAuthExceptionCode(e.code)}");
    throw Exception(mapFirebaseAuthExceptionCode(e.code));
  } 
  catch(error){
    print('Error resetting password: $error');
  }
}

}
