import 'package:flutter_test/flutter_test.dart';

import 'package:voice_room/main.dart';

void main() {
  testWidgets('App renders auth screen', (WidgetTester tester) async {
    await tester.pumpWidget(const VoiceRoomApp());
    await tester.pumpAndSettle();

    expect(find.text('VoiceRoom'), findsOneWidget);
    expect(find.text('Continue with Phone'), findsOneWidget);
  });
}
