import 'dart:convert';
import '../lib/students.dart';

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<Map<String, String>> peopleList = (jsonDecode(json) as List<dynamic>)
      .map((item) => (item as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value.toString())))
      .toList();

  Students students = Students(peopleList);

  // Sort by the last name
  students.sort('last');
  print('After sorting by last name:');
  students.output();

  // Add a new person
  students.plus({"first": "Ashley", "last": "Brown", "email": "ashley.brown@example.com"});
  print('\nAfter adding a new person:');
  students.output();

  // Remove a person based on an email match
  students.remove('shaha@algonquincollege.com');
  print('\nAfter removing a person with email shaha@algonquincollege.com:');
  students.output();
}
