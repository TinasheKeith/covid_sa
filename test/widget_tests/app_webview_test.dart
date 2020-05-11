import 'package:flutter/material.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covid_sa/ui/widgets/app_webview.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final url = "https://twitter.com";

  group("AppWebView test", () {
    NavigatorObserver mockObserver;
    MaterialApp app;

    setUp(() {
      mockObserver = MockNavigatorObserver();
      app = MaterialApp(
        home: AppWebView(url: url),
        navigatorObservers: [mockObserver],
      );
    });

    Future<Null> _navigateBack(WidgetTester tester) async {
      await tester.tap(find.byKey(AppWebView.closeWebViewKey));
      await tester.pumpAndSettle();
    }

    testWidgets("can close webview", (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await _navigateBack(tester);
      verify(mockObserver.didPop(any, any));
    });

    // testWidgets("Renders a WebView", (WidgetTester tester) async {
    //   await tester.pumpWidget(app);
    //   expect(find.byWidget(WebView(initialUrl: url)), findsOneWidget);
    // });
  });
}
