import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whitespace/models/personal_details_model.dart';

class UserDetails{
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(String firstname,String lastname, String degree, int year,int semester,List<String> selectedSubjects) async{
        try{
          final user=User(
            id:"",
            firstName: firstname,
            lastName: lastname,
            degreeProgram: degree,
            year: year,
            semester: semester,
            selectedSubjects: selectedSubjects,
          );
          final Map<String, dynamic> userData  = user.toJson();
          await _userCollection.add(userData);
          
        }catch(e){
          print("Error adding user: $e");
        }
  }
}