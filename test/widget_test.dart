import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oivan_app/src/app.dart';
import 'package:oivan_app/src/di.dart' as di;

void main() async {
  await di.init();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(sofLocalUsersDatabase: di.sl(),));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
