import 'dart:math';

// Function that returns a random name for even numbers, null for odd numbers
String? getUsername(int num) {
  if (num % 2 == 0) {
    // List of random names
    List<String> names = [
      'Alice',
      'Bob',
      'Charlie',
      'Diana',
      'Edward',
      'Fiona',
      'George',
      'Hannah',
      'Ivan',
      'Julia',
    ];

    // Generate random index and return random name
    Random random = Random();
    int randomIndex = random.nextInt(names.length);
    return names[randomIndex];
  } else {
    // Return null for odd numbers
    return null;
  }
}

void main() {
  print('Calling getUsername() function 10 times:\n');

  // Call the function 10 times
  for (int i = 1; i <= 10; i++) {
    String? username = getUsername(i);

    // if (username != null) {
    //   // Print username in uppercase if not null
    //   print(username.toUpperCase());
    // } else {
    //   // Print "NA" for null results
    //   print('NA');
    // }
    //alternative approach
    print((username ?? 'na').toUpperCase());
  }
}
