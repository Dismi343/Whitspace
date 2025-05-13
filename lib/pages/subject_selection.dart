import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:whitespace/constants/colors.dart";
import "package:google_fonts/google_fonts.dart";

class SubjectSelection extends StatefulWidget {
  final List<String> avilsub;
  final String firstname;
   final String lastname;
   final String degree;
   final int year;
    final int semester;

  const SubjectSelection({Key? key, required this.avilsub, required this.firstname, required this.lastname, required this.degree, required this.year, required this.semester}) : super(key: key);

  void sample() {}
  @override
  State<SubjectSelection> createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {


  
  late Map<String, bool> selectedOptions;

   List<String> selectedSubjects = [];
  @override
  void initState() {
    super.initState();
    // Initialize the selectedOptions map with all subjects set to false
    selectedOptions = {for (var subject in widget.avilsub) subject: false};
  }
  void printDone(){
    print("done");
    print("firstname : ${widget.firstname}");
    print("lastname : ${widget.lastname}");
    print("degree : ${widget.degree}");
    print("year : ${widget.year}");
    print("semester : ${widget.semester}");
    print("selected subjects : ${selectedSubjects.join(', ')}");

   
  }

  @override
  Widget build(BuildContext context) {
    // Determine if any subject is selected
    bool isButtonEnabled = selectedOptions.containsValue(true);
      
    return Scaffold(
      appBar: AppBar(title: Text("select your subjects")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children:
                  widget.avilsub.map((subject) {
                    return CheckboxListTile(
                      title: Text(subject),
                      value: selectedOptions[subject],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedOptions[subject] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                elevation: 5,
                backgroundColor: primaryYellow,
              ),
              onPressed:
                  isButtonEnabled
                      ? () {
                        

                        // Perform action with selected subjects
                         selectedSubjects =
                            selectedOptions.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList();

                          printDone();
                        // Example action: Display selected subjects
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('Selected Subjects'),
                                content: Text(selectedSubjects.join(', ')),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                        );
                      }
                      : null, // Disable button if no subject is selected
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
