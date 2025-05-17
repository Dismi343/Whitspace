import 'package:flutter/material.dart';
import 'package:whitespace/models/personal_details_model.dart';
import 'package:whitespace/services/auth_service.dart';
import 'package:whitespace/services/userdetails_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? user;

 final String userId = AuthService().getCurrentUser()?.uid ?? 'Unknown';

    void fetchUser(String id) async {
         final userService = UserDetails();
         final fetchdata = await userService.getUserById(id);

         setState(() {
           user= fetchdata;
         });

         print(fetchdata);

        if (fetchdata != null) {
          print("User Name: ${fetchdata.firstName} ${fetchdata.lastName}");
         } else {
           print("User not found");
         }

    }

  @override
  void initState() {
    super.initState();
    fetchUser(userId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("FisrtName: ${user!.firstName}, LastName: ${user!.lastName}"),
                  Text("Degree: ${user!.degreeProgram}"),
                  Text("Year: ${user!.year}"),
                  Text("Semester: ${user!.semester}"),
                  Text("Subjects: ${user!.selectedSubjects.join(', ')}"),
                  // Add other fields
                ],
              ),
            ),
    );
  }
}