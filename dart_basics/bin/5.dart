class Student {
  // Private properties
  int _rollNo;
  String _studentName;
  String _departmentName;
  int _age;
  String _gender;
  DateTime _dateOfBirth;

  // Default constructor
  Student(
    this._rollNo,
    this._studentName,
    this._departmentName,
    this._age,
    this._gender,
    this._dateOfBirth,
  );

  // Getters
  int get rollNo => _rollNo;
  String get studentName => _studentName;
  String get departmentName => _departmentName;
  int get age => _age;
  String get gender => _gender;
  DateTime get dateOfBirth => _dateOfBirth;

  // Setters
  set rollNo(int value) {
    if (value > 0) {
      _rollNo = value;
    } else {
      throw ArgumentError('Roll number must be positive');
    }
  }

  set studentName(String value) {
    if (value.isNotEmpty) {
      _studentName = value;
    } else {
      throw ArgumentError('Student name cannot be empty');
    }
  }

  set departmentName(String value) {
    if (value.isNotEmpty) {
      _departmentName = value;
    } else {
      throw ArgumentError('Department name cannot be empty');
    }
  }

  set age(int value) {
    if (value > 0 && value <= 150) {
      _age = value;
    } else {
      throw ArgumentError('Age must be between 1 and 150');
    }
  }

  set gender(String value) {
    if (value.isNotEmpty) {
      _gender = value;
    } else {
      throw ArgumentError('Gender cannot be empty');
    }
  }

  set dateOfBirth(DateTime value) {
    if (value.isBefore(DateTime.now())) {
      _dateOfBirth = value;
    } else {
      throw ArgumentError('Date of birth must be in the past');
    }
  }

  // Method to display student information
  void displayInfo() {
    print('--- Student Information ---');
    print('Roll No: $_rollNo');
    print('Name: $_studentName');
    print('Department: $_departmentName');
    print('Age: $_age');
    print('Gender: $_gender');
    print(
      'Date of Birth: ${_dateOfBirth.day}/${_dateOfBirth.month}/${_dateOfBirth.year}',
    );
    print('-------------------------');
  }

  @override
  String toString() {
    return 'Student{rollNo: $_rollNo, name: $_studentName, dept: $_departmentName, age: $_age, gender: $_gender, dob: $_dateOfBirth}';
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

  // Demonstrating getters and setters
  print('\n--- Using Getters ---');
  print('Roll No: ${student1.rollNo}');
  print('Name: ${student1.studentName}');
  print('Department: ${student1.departmentName}');

  print('\n--- Using Setters ---');
  student1.rollNo = 102;
  student1.studentName = 'Priya';
  student1.age = 21;

  print('Updated Information:');
  student1.displayInfo();

  // Example of validation in setters
  print('\n--- Testing Validation ---');
  try {
    student1.rollNo = -5; // This will throw an error
  } catch (e) {
    print('Error: $e');
  }

  try {
    student1.studentName = ''; // This will throw an error
  } catch (e) {
    print('Error: $e');
  }
}
