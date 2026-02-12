import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website/main.dart';

void main() {
  testWidgets('Portfolio loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the title is present
    expect(find.text('SALMAN'), findsOneWidget);
  });
}
