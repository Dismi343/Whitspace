import "package:flutter/material.dart";
import "package:whitespace/constants/colors.dart";
import "package:google_fonts/google_fonts.dart";

class SubjectSelection extends StatefulWidget {
  final List<String> avilsub;
  const SubjectSelection({Key? key, required this.avilsub}) : super(key: key);

  void sample() {}
  @override
  State<SubjectSelection> createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {
  late Map<String, bool> selectedOptions;

  @override
  void initState() {
    super.initState();
    // Initialize the selectedOptions map with all subjects set to false
    selectedOptions = {for (var subject in widget.avilsub) subject: false};
  }
  void printDone(){
    print("done");
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
                        printDone();
                        // Perform action with selected subjects
                        List<String> selectedSubjects =
                            selectedOptions.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList();
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
