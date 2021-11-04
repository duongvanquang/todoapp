// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:todoapp/src/screens/navigator_bottom_screen.dart';
// import '../../handler_test/router_help.dart' as setRoute;

// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// class MyFakeType extends Fake implements Route {}

// main() async {
//   NavigatorObserver mockObserver;
//   mockObserver = MockNavigatorObserver();
//   setUp(() => {registerFallbackValue(MyFakeType())});
//   final widget = MaterialApp(
//     home: const Scaffold(
//       body: BottomNavigation(),
//     ),
//     onGenerateRoute: setRoute.Router.generateRoute,
//     navigatorObservers: [mockObserver],
//   );
//   testWidgets('Should render  icon image bottomtab home , add and task',
//       (tester) async {
//     tester.binding.window.physicalSizeTestValue = const Size(360, 640);
//     tester.binding.window.devicePixelRatioTestValue = 1.0;
//     addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
//     const imageHome = AssetImage(
//       'assets/images/icon_home.png',
//     );
//     const imageAdd = AssetImage(
//       'assets/images/icon_task.png',
//     );
//     const imageTask = AssetImage(
//       'assets/images/add_button.png',
//     );
//     await tester.pumpWidget(widget);
//     final homeImageFinder =
//         tester.widgetList<Image>(find.byType(Image)).toList();
//     expect(homeImageFinder[2].image, imageHome);
//     await tester.tap(find.byType(Image).first);
//     final addImageFinder =
//         tester.widgetList<Image>(find.byType(Image)).toList();
//     expect(addImageFinder[3], imageAdd);
//     final taskImageFinder =
//         tester.widgetList<Image>(find.byType(Image)).toList();
//     expect(taskImageFinder[4], imageTask);
//     await tester.pump();
//     verify(() => mockObserver.didPush(any(), any()));
//   });
// }
