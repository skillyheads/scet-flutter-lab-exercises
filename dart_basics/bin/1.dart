import 'dart:io';

void main() {
  print('Enter your email address:');
  String email = stdin.readLineSync()!; // Non-nullable variable

  if (validateEmail(email)) {
    print('Valid email address: $email');
  } else {
    print('Invalid email address: $email');
  }
}

bool validateEmail(String email) {
  // Check if email contains exactly one '@'
  int atCount = 0;
  int atIndex = -1;

  for (int i = 0; i < email.length; i++) {
    if (email[i] == '@') {
      atCount++;
      atIndex = i;
    }
  }

  // Must have exactly one '@'
  if (atCount != 1) {
    return false;
  }

  // Check if there's at least one dot after '@'
  String afterAt = email.substring(atIndex + 1);
  if (!afterAt.contains('.')) {
    return false;
  }

  // Additional basic checks
  if (atIndex == 0 || atIndex == email.length - 1) {
    return false; // '@' cannot be at start or end
  }

  return true;
}
