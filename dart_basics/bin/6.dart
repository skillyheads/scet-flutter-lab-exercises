import 'dart:io';

// Method that returns a Future<String> after 10 seconds delay
Future<String> getDelayedMessage() async {
  print('Starting delayed operation...');
  await Future.delayed(Duration(seconds: 10));
  return 'Hello! This message was delayed for 10 seconds.';
}

void main() async {
  // Show current time
  DateTime startTime = DateTime.now();
  print(
    'Start time: ${startTime.hour}:${startTime.minute}:${startTime.second}\n',
  );

  // Demonstrate both blocked and non-blocked approaches
  await demonstrateBlockedApproach();
  await demonstrateNonBlockedApproach();
}

// Blocked (Synchronous) way - using await
Future<void> demonstrateBlockedApproach() async {
  print('--- BLOCKED (Synchronous) Approach ---');
  print('Main thread will wait for the operation to complete...');

  DateTime beforeWait = DateTime.now();
  print(
    'Before await: ${beforeWait.hour}:${beforeWait.minute}:${beforeWait.second}',
  );

  // This will block and wait for completion
  String result = await getDelayedMessage();

  DateTime afterWait = DateTime.now();
  print(
    'After await: ${afterWait.hour}:${afterWait.minute}:${afterWait.second}',
  );
  print('Result: $result');
  print('This approach blocked the main thread for 10 seconds.\n');
}

// Non-blocked (Asynchronous) way - using then() and continuing other work
Future<void> demonstrateNonBlockedApproach() async {
  print('--- NON-BLOCKED (Asynchronous) Approach ---');
  print('Main thread will continue other work while waiting...');

  DateTime beforeAsync = DateTime.now();
  print(
    'Before async call: ${beforeAsync.hour}:${beforeAsync.minute}:${beforeAsync.second}',
  );

  // Start the async operation but don't wait for it
  Future<String> futureResult = getDelayedMessage();
  futureResult.then((result) {
    DateTime afterAsync = DateTime.now();
    print(
      'After async completion: ${afterAsync.hour}:${afterAsync.minute}:${afterAsync.second}',
    );
    print('Result: $result');
    print('This approach allowed other work to continue while waiting.\n');
  });

  // Continue other work immediately
  print('This line executes immediately, not waiting for the .then() callback');

  // Wait a bit to see the callback result
  await Future.delayed(Duration(seconds: 4));
  print('Demo completed!');
}
