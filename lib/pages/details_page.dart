import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:whitespace/constants/colors.dart";
import "package:whitespace/constants/fotter.dart";
import "package:whitespace/models/personal_details_model.dart";
import "package:whitespace/pages/subject_selection.dart";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? selectedDegreeProgram;
  String? firstname;
  String? lastname;
  int? selectedYear;
  int? selectedSemester;

  List<String> availableSub = [];

  void avilSub() {
    if (selectedDegreeProgram == 'Computer Science' &&
        selectedYear == 1 &&
        selectedSemester == 1) {
      availableSub = cs11;
    }
    if (selectedDegreeProgram == 'Computer Science' &&
        selectedYear == 1 &&
        selectedSemester == 2) {
      availableSub = cs12;
    }
  }

  void printdata() {
    print("fisrtname : $firstname");
    print("lastname : $lastname");
    print("selectedDegree : $selectedDegreeProgram");
    print("selectedYear : $selectedYear");
    print("selectedSemester : $selectedSemester");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Details",
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30),
            Form(
              child: Container(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryBlue, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter First name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        firstname = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryBlue, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter Last name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        lastname = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Degree Program',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryBlue, width: 1),
                        ),
                      ),
                      items:
                          DegreeProgram.map((program) {
                            return DropdownMenuItem(
                              value: program,
                              child: Text(program),
                            );
                          }).toList(),
                      // value:"DegreeProgram",
                      onChanged: (value) {
                        setState(() {
                          selectedDegreeProgram = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Year',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryBlue, width: 1),
                        ),
                      ),
                      items:
                          Year.map((program) {
                            return DropdownMenuItem(
                              value: program,
                              child: Text(program.toString()),
                            );
                          }).toList(),
                      // value:"DegreeProgram",
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Semester',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryBlue, width: 1),
                        ),
                      ),
                      items:
                          Semester.map((program) {
                            return DropdownMenuItem(
                              value: program,
                              child: Text(program.toString()),
                            );
                          }).toList(),
                      // value:"DegreeProgram",
                      onChanged: (value) {
                        setState(() {
                          selectedSemester = value;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 60),
                        elevation: 5,
                        backgroundColor: primaryYellow,
                      ),
                      onPressed: () {
                        setState(() {
                          if (firstname == null ||
                              lastname == null ||
                              selectedDegreeProgram == null ||
                              selectedSemester == null ||
                              selectedYear == null) {
                            print("enter all details");
                          } else {
                            printdata();
                            avilSub();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SubjectSelection(avilsub: availableSub),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Fotter(),
          ],
        ),
      ),
    );
  }
}
