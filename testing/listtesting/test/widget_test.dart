import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listtesting/main.dart';

void main() {
  group('Names List App Tests', () {
    testWidgets('App should display title and buttons on startup', (
      WidgetTester tester,
    ) async {
      // Build the app
      await tester.pumpWidget(MyApp());

      // Verify app bar title
      expect(find.text('Names List'), findsOneWidget);

      // Verify both buttons are present
      expect(find.text('Show Names'), findsOneWidget);
      expect(find.text('Hide Names'), findsOneWidget);

      // Verify initial empty message is displayed
      expect(find.byKey(Key('empty_message')), findsOneWidget);
      expect(
        find.text('Click "Show Names" to display the list'),
        findsOneWidget,
      );

      // Verify list is not visible initially
      expect(find.byKey(Key('names_list')), findsNothing);
    });

    testWidgets('Show button should display the names list', (
      WidgetTester tester,
    ) async {
      // Build the app
      await tester.pumpWidget(MyApp());

      // Verify list is not visible initially
      expect(find.byKey(Key('names_list')), findsNothing);
      expect(find.byKey(Key('empty_message')), findsOneWidget);

      // Tap the show button
      await tester.tap(find.byKey(Key('show_button')));
      await tester.pump(); // Crucial: pump to apply state changes

      // Verify list is now visible
      expect(find.byKey(Key('names_list')), findsOneWidget);
      expect(find.byKey(Key('empty_message')), findsNothing);

      // Verify some names are displayed
      expect(find.text('Alice Johnson'), findsOneWidget);
      expect(find.text('Bob Smith'), findsOneWidget);
      expect(find.text('Charlie Brown'), findsOneWidget);
    });

    testWidgets('Hide button should hide the names list', (
      WidgetTester tester,
    ) async {
      // Build the app
      await tester.pumpWidget(MyApp());

      // First show the list
      await tester.tap(find.byKey(Key('show_button')));
      await tester.pump();

      // Verify list is visible
      expect(find.byKey(Key('names_list')), findsOneWidget);
      expect(find.byKey(Key('empty_message')), findsNothing);

      // Now hide the list
      await tester.tap(find.byKey(Key('hide_button')));
      await tester.pump(); // Pump to apply state changes

      // Verify list is hidden and empty message is back
      expect(find.byKey(Key('names_list')), findsNothing);
      expect(find.byKey(Key('empty_message')), findsOneWidget);
      expect(find.text('Alice Johnson'), findsNothing);
    });
  });
}
