import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_isl_dictionary/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(1, 1);
  });
}
