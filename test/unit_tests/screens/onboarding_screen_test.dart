import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp/src/screens/onboading_screen.dart';
import '../../handler_test/router_help.dart' as setRoute;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MyFakeType extends Fake implements Route {}

main() async {
  NavigatorObserver mockObserver;
  mockObserver = MockNavigatorObserver();
  setUp(() => {registerFallbackValue(MyFakeType())});
  final widget = MaterialApp(
    home: const Scaffold(
      body: OnboadingScreen(),
    ),
    onGenerateRoute: setRoute.Router.generateRoute,
    navigatorObservers: [mockObserver],
  );
  testWidgets('Should render image onboarding screen', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(360, 640);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);
    const imageLogo = AssetImage(
      'assets/images/logo_started.png',
    );
    final logoImageFinder =
        tester.widgetList<Image>(find.byType(Image)).toList();
    expect(logoImageFinder[0].image, imageLogo);
  });
  testWidgets('should render text onboarding with screen', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(360, 640);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);
    final titleOndoarding = find.text(tr('onboarding.titleonboarding'));
    final nameOnboarding = find.text(tr('onboarding.nameonbroading'));
    expect(titleOndoarding, findsOneWidget);
    expect(nameOnboarding, findsOneWidget);
  });
  testWidgets('Click on button onboarding with screen', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(360, 640);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);
    await tester
        .tap(find.widgetWithText(InkWell, tr('onboarding.buttononboarding')));
    await tester.pumpAndSettle();
    verify(() => mockObserver.didPush(any(), any()));
  });
}
