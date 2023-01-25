import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/features/calculator/views/pages/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CalculatorPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CalculatorHome), findsOneWidget);
    });
  });
}
