import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lovecalculatorapp/main.dart';

void main() {
  testWidgets('Love Calculator App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LoveCalculatorApp());

    // Verify that the input fields and button are present.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter text into the input fields.
    await tester.enterText(find.byType(TextField).at(0), 'Your Name');
    await tester.enterText(find.byType(TextField).at(1), 'Partner Name');

    // Tap the 'Calculate Love' button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the result is displayed.
    expect(find.textContaining('%'), findsOneWidget);
  });
}
