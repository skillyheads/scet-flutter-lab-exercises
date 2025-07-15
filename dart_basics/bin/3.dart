class Student {
  int rollNo;
  String studentName;
  String departmentName;
  int age;
  String gender;
  DateTime dateOfBirth;

  // Default constructor
  Student(
    this.rollNo,
    this.studentName,
    this.departmentName,
    this.age,
    this.gender,
    this.dateOfBirth,
  );

  // Method to display student information
  void displayInfo() {
    print('--- Student Information ---');
    print('Roll No: $rollNo');
    print('Name: $studentName');
    print('Department: $departmentName');
    print('Age: $age');
    print('Gender: $gender');
    print(
      'Date of Birth: ${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}',
    );
    print('-------------------------');
  }

  @override
  String toString() {
    return 'Student{rollNo: $rollNo, name: $studentName, dept: $departmentName, age: $age, gender: $gender, dob: $dateOfBirth}';
  }
}

void main() {
  // Creating object and assigning values
  Student student1 = Student(
    101,
    'Lalitha',
    'Computer Science',
    20,
    'Female',
    DateTime(2004, 3, 15),
  );

  // Printing student information
  student1.displayInfo();
  print('\nUsing toString(): $student1');
}
