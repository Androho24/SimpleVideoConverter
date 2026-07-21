import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/main.dart';
import 'package:simple_video_converter/screens/converter_screen.dart';

void main() {
  testWidgets('shows the converter on app start', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(VideoConverterApp), findsOneWidget);
  });
}
