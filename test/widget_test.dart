import 'package:flutter_test/flutter_test.dart';
import 'package:netquest/main.dart';

void main() {
  testWidgets('NetQuestApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const NetQuestApp());
    await tester.pumpAndSettle();

    expect(find.text('NetQuest'), findsOneWidget);
    expect(find.text('Misi Jaringan Komputer'), findsOneWidget);
    expect(find.text('Mulai Cek Kesiapan'), findsOneWidget);
  });
}
