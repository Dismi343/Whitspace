import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whitespace/models/personal_details_model.dart';

class UserDetails{
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(String id, String firstname,String lastname, String degree, int year,int semester,List<String> selectedSubjects) async{
        try{
          final user=User(
            id:id,
            firstName: firstname,
            lastName: lastname,
            degreeProgram: degree,
            year: year,
            semester: semester,
            selectedSubjects: selectedSubjects,
          );
          final Map<String, dynamic> userData  = user.toJson();
          await _userCollection.doc(id).set(userData);
          
        }catch(e){
          print("Error adding user: $e");
        }
  }


  Future<User?> getUserById(String id)async{
    try{
      DocumentSnapshot doc =await _userCollection.doc(id).get();

      if(doc.exists){
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; 
        return User.fromJson(data);

      }
      else{
        print("User not found");
        return null;
      }

    }catch(e){
      print("Error getting user: $e");
      return null;
    }
  } 

  // Stream<List<User>> getUser(){
  //   return _userCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data() as Map<String, dynamic>)).toList());
  // }
}