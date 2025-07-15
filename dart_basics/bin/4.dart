class Student {
  int rollNo;
  String studentName;
  String departmentName;
  int age;
  String gender;
  DateTime dateOfBirth;

  // 1. Default/Positional Constructor
  Student(
    this.rollNo,
    this.studentName,
    this.departmentName,
    this.age,
    this.gender,
    this.dateOfBirth,
  );

  // 2. Named Parameterized Constructor
  Student.withNamedParams({
    required this.rollNo,
    required this.studentName,
    required this.departmentName,
    required this.age,
    required this.gender,
    required this.dateOfBirth,
  });

  // 3. Named Constructor (for creating student with default values)
  Student.defaultStudent(this.rollNo, this.studentName)
    : departmentName = 'General',
      age = 18,
      gender = 'Not Specified',
      dateOfBirth = DateTime(2006, 1, 1);

  // 4. Factory Constructor (for creating student from Map)
  factory Student.fromMap(Map<String, dynamic> data) {
    return Student(
      data['rollNo'] ?? 0,
      data['studentName'] ?? 'Unknown',
      data['departmentName'] ?? 'General',
      data['age'] ?? 18,
      data['gender'] ?? 'Not Specified',
      DateTime.parse(data['dateOfBirth'] ?? '2006-01-01'),
    );
  }

  // Another factory constructor
  factory Student.quickCreate(String name, int rollNo) {
    return Student(
      rollNo,
      name,
      'Computer Science',
      20,
      'Not Specified',
      DateTime(2004, 1, 1),
    );
  }

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
}

void main() {
  print('=== Different Constructor Examples ===\n');

  // 1. Using default/positional constructor
  Student student1 = Student(
    101,
    'John Doe',
    'Engineering',
    21,
    'Male',
    DateTime(2003, 5, 10),
  );
  print('1. Default Constructor:');
  student1.displayInfo();

  // 2. Using named parameterized constructor
  Student student2 = Student.withNamedParams(
    rollNo: 102,
    studentName: 'Jane Smith',
    departmentName: 'Medicine',
    age: 22,
    gender: 'Female',
    dateOfBirth: DateTime(2002, 8, 20),
  );
  print('2. Named Parameterized Constructor:');
  student2.displayInfo();

  // 3. Using named constructor
  Student student3 = Student.defaultStudent(103, 'Bob Wilson');
  print('3. Named Constructor (with defaults):');
  student3.displayInfo();

  // 4. Using factory constructor with Map
  Map<String, dynamic> studentData = {
    'rollNo': 104,
    'studentName': 'Alice Brown',
    'departmentName': 'Physics',
    'age': 19,
    'gender': 'Female',
    'dateOfBirth': '2005-12-03',
  };
  Student student4 = Student.fromMap(studentData);
  print('4. Factory Constructor (from Map):');
  student4.displayInfo();

  // 5. Using another factory constructor
  Student student5 = Student.quickCreate('Charlie Davis', 105);
  print('5. Factory Constructor (quick create):');
  student5.displayInfo();
}
