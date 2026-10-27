import 'package:flutter_test/flutter_test.dart';
import 'package:profile_card_app/main.dart';

void main() {
  testWidgets('profile card fits a narrow layout and shows all profile details',
      (tester) async {
    tester.view.physicalSize = const Size(360, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const ProfileApp());

    expect(find.text('Asha Verma'), findsOneWidget);
    expect(find.text('Flutter Intern'), findsOneWidget);
    expect(find.text('AV'), findsOneWidget);
    expect(find.text('asha@example.com'), findsOneWidget);
    expect(find.text('+91 90000 00000'), findsOneWidget);
    expect(find.text('Pune, India'), findsOneWidget);
    expect(find.byType(ContactRow), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });
}

