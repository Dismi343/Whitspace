import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class User{
  String id;
  String firstName;
  String lastName;
  String degreeProgram;
  int year;
  int semester;
  List<String> selectedSubjects ;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.degreeProgram,
    required this.year,
    required this.semester,
    required this.selectedSubjects,
  });

factory User.fromJson(Map<String, dynamic> json, String id) {
    return User(
      id:id,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      degreeProgram: json['degreeProgram'] ?? '',
      year: json['year'] ?? 0,
      semester: json['semester'] ?? 0,
      selectedSubjects: List<String>.from(json['selectedSubjects'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
     
      'firstName': firstName,
      'lastName': lastName,
      'degreeProgram': degreeProgram,
      'year': year,
      'semester': semester,
      'selectedSubjects': selectedSubjects,
    };
  }

}

List<String> DegreeProgram = [
  'Mathematics',
  'Computer Science',
  'Physics',
  'Chemistry',
  'Biology',
  'Zoology',
  'Botany',
];

List<int> Year = [3, 4];

List<int> Semester = [1, 2];

List<String> cs31 = [
  'CSS3113',
  'CSS3123',
  'CSS3132',
  'CSS3142',
  'CSS3152',
  'CSS3162',
  'CSS3172',
  'CSS3192',
  'MAT313b',
];
List<String> cs32 = [
  'CSS3212',
  'CSS3223',
  'CSS3232',
  'CSS3242',
  'CSS3252',
  'CSS3262',
  'CSS3272',
  'IMT321b',
];
